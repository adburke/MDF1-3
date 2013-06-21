//
//  MoreInfoViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>

@interface MoreInfoViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, MKMapViewDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property(nonatomic, weak) IBOutlet UILabel *hotelNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *hotelDescrLabel;
@property(nonatomic, weak) IBOutlet UIImageView *hotelPic;

// Picture collection view outlet
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

// Map block outlets
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapSegCtrl;

// Weather block outlets
@property (weak, nonatomic) IBOutlet UILabel *hotelLocation;
@property (weak, nonatomic) IBOutlet UILabel *highTemp;
@property (weak, nonatomic) IBOutlet UILabel *lowTemp;
@property (weak, nonatomic) IBOutlet UILabel *currentCondition;
@property (weak, nonatomic) IBOutlet UIImageView *conditionImage;
@property (weak, nonatomic) IBOutlet UILabel *subForecastDate;
@property (weak, nonatomic) IBOutlet UILabel *forecastDate;

// Delegate data from firstViewController
@property (nonatomic, strong) NSDictionary *linkInfo;
// Data collection from wunderground api call
@property (nonatomic, strong) NSMutableData *responseData;


// Method for segmented control of mapView map type
-(IBAction)onChange:(id)sender;

@end
