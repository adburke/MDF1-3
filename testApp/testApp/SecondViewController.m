//
//  SecondViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/17/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "SecondViewController.h"
#import "MapAnnotation.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map View", @"Map View");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    // Removes annotations so they can be refreshed on new load
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    // Pull current instance of location manager singleton
    self.locationShare = [LocationsManager sharedInstance];
    //NSLog(@"%@", self.locationShare.locationsArray);
    
    NSMutableArray *locationHolder = [[NSMutableArray alloc]init];
    
    // Iterate through singleton to pull out location data - used fast enumeration on array and block on dictionary
    for (id obj1 in self.locationShare.locationsArray){
        //NSLog(@"obj=%@", obj1);
        [obj1 enumerateKeysAndObjectsUsingBlock:^(id key, id obj2, BOOL *stop) {
            //NSLog(@"%@ => %@", key, obj2);
            if ([key isEqualToString:@"Loc"]) {
                CLLocationCoordinate2D location;
                location.latitude = [obj2[0] doubleValue];
                location.longitude = [obj2[1] doubleValue];
                
                // Gather annotations in array
                MapAnnotation *annotation = [[MapAnnotation alloc] initWithInfo:obj1[@"Hotel"] subText:@"Test" coord:location];
                if (annotation) {
                    [locationHolder addObject:annotation];
                }
            }
        }];
    }
    // Load the array of annotations
    [self.mapView addAnnotations:locationHolder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
