//
//  MoreInfoViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "MoreInfoViewController.h"
#import "CVCellController.h"

@interface MoreInfoViewController ()

@end

@implementation MoreInfoViewController

@synthesize linkInfo, hotelDescrLabel, hotelNameLabel, hotelPic, mapView;

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
    return [[linkInfo objectForKey:@"Pictures"] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cvCell";
    CVCellController *cell = (CVCellController *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
    NSArray *pictures = [linkInfo objectForKey:@"Pictures"];
    cell.pictureHolder.image = [UIImage imageNamed:pictures[indexPath.row]];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    hotelNameLabel.text = linkInfo[@"Hotel"];
    hotelPic.image = [UIImage imageNamed:linkInfo[@"Image"]];
    
    // Register the custom cell class 
    [self.collectionView registerClass:[CVCellController class] forCellWithReuseIdentifier:@"cvCell"];
    
    // Map view properties
    NSArray *hotelLoc = linkInfo[@"Loc"]; // holds lat long in array -- [0] = lat [1] = long
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
    mapView.region = region;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

