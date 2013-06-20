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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.hotelNameLabel.text = self.linkInfo[@"Hotel"];
    self.hotelPic.image = [UIImage imageNamed:self.linkInfo[@"Image"]];
    
    // Register the custom cell class 
    [self.collectionView registerClass:[CVCellController class] forCellWithReuseIdentifier:@"cvCell"];
    
    // Map view properties
    NSArray *hotelLoc = self.linkInfo[@"Loc"]; // holds lat long in array -- [0] = lat [1] = long
    double lat = [hotelLoc[0] doubleValue];
    double lng = [hotelLoc[1] doubleValue];
    
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

