//
//  MoreInfoViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "MoreInfoViewController.h"
#import "CVCellController.h"
#import "MapAnnotation.h"

@interface MoreInfoViewController ()

@end

@implementation MoreInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewSelectedInfo:(NSDictionary*)cellInfo
{
    self.linkInfo = cellInfo;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self.linkInfo objectForKey:@"Pictures"] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cvCell";
    CVCellController *cell = (CVCellController *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
    NSArray *pictures = [self.linkInfo objectForKey:@"Pictures"];
    cell.pictureHolder.image = [UIImage imageNamed:pictures[indexPath.row]];
    
    return cell;
}

-(IBAction)onChange:(id)sender
{
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSString *msg = [NSString stringWithFormat:@"Failed: %@", [error description]];
    NSLog(@"%@",msg);
}

//All the data was loaded, let's see what we've got...
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *myError = nil;
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves  error:&myError];
    NSArray *forecastday = results[@"forecast"][@"simpleforecast"][@"forecastday"];
    //NSLog(@"forecastday=%@", forecastday);
    NSString *high = forecastday[0][@"high"][@"fahrenheit"];
    NSLog(@"high=%@", high);
    self.highTemp.text = [NSString stringWithFormat:@"%@%@ F", high, @"\u00B0"];
    NSString *low = forecastday[0][@"low"][@"fahrenheit"];
    NSLog(@"low=%@", low);
    self.lowTemp.text = [NSString stringWithFormat:@"%@%@ F", low, @"\u00B0"];
    NSString *conditions = forecastday[0][@"conditions"];
    self.currentCondition.text = conditions;
    
    NSDictionary *conditionImages = @{@"Chance of Flurries":@"chanceflurries.gif",
                                      @"Chance of Rain":@"chancerain.gif",
                                      @"Chance of Freezing Rain":@"chancesleet.gif",
                                      @"Chance of Sleet":@"chancesleet.gif",
                                      @"Chance of Snow":@"chancesnow",
                                      @"Chance of Thunderstorms":@"chancetstorms.gif",
                                      @"Chance of a Thunderstorm":@"chancetstorms.gif",
                                      @"Clear":@"clear.gif",
                                      @"Cloudy":@"cloudy.gif",
                                      @"Flurries":@"flurries.gif",
                                      @"Fog":@"fog.gif",
                                      @"Haze":@"hazy.gif",
                                      @"Mostly Cloudy":@"mostlycloudy.gif",
                                      @"Partly Cloudy":@"partlycloudy.gif",
                                      @"Mostly Sunny":@"mostlysunny.gif",
                                      @"Partly Sunny":@"partlysunny.gif",
                                      @"Freezing Rain":@"sleet.gif",
                                      @"Rain":@"rain.gif",
                                      @"Sleet":@"sleet.gif",
                                      @"Snow":@"snow.gif",
                                      @"Sunny":@"sunny.gif",
                                      @"Thunderstorms":@"tstorms.gif",
                                      @"Thunderstorm":@"tstorms.gif",
                                      @"Overcast":@"cloudy.gif",
                                      @"Scattered Clouds":@"partlycloudy.gif"
                                      };
    
    for (id key in conditionImages) {
        if ([conditions isEqualToString:key]) {
            //NSString *conditionImg = conditionImages[key];
            self.conditionImage.image = [UIImage imageNamed:conditionImages[key]];
        }
    }
    
}


- (void)viewWillAppear:(BOOL)animated
{
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *hotelLoc = self.linkInfo[@"Loc"]; // holds lat long in array -- [0] = lat [1] = long
    double lat = [hotelLoc[0] doubleValue];
    double lng = [hotelLoc[1] doubleValue];
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.wunderground.com/api/d97410dd6342cdac/forecast/q/%0.1f,%0.1f.json", lat, lng];
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:
                                [NSURL URLWithString:urlString]];
    NSURLConnection *theConnection=[[NSURLConnection alloc]
                                    initWithRequest:theRequest delegate:self];
    if(theConnection){
        self.responseData = [[NSMutableData alloc] init];
    } else {
        NSLog(@"failed");
    }
    
    // Do any additional setup after loading the view from its nib.
    self.hotelNameLabel.text = self.linkInfo[@"Hotel"];
    self.hotelPic.image = [UIImage imageNamed:self.linkInfo[@"Image"]];
    self.hotelLocation.text = [NSString stringWithFormat:@"%@, %@", self.linkInfo[@"City"], self.linkInfo[@"State"]];
    
    // Register the custom cell class 
    [self.collectionView registerClass:[CVCellController class] forCellWithReuseIdentifier:@"cvCell"];
    
    // Map view properties
    MKCoordinateSpan span;
    span.latitudeDelta = 0.05f;
    span.longitudeDelta = 0.05f;
    
    CLLocationCoordinate2D location;
    location.latitude = lat;
    location.longitude = lng;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    self.mapView.region = region;
    
    MapAnnotation *annotation = [[MapAnnotation alloc] initWithInfo:self.linkInfo[@"Hotel"] subText:@"Test" coord:location];
    if (annotation) {
        [self.mapView addAnnotation:annotation];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

