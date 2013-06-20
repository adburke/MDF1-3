//
//  MoreInfoViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>

@interface MoreInfoViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, MKMapViewDelegate>

@property(nonatomic, weak) IBOutlet UILabel *hotelNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *hotelDescrLabel;
@property(nonatomic, weak) IBOutlet UIImageView *hotelPic;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapSegCtrl;

@property (nonatomic, strong) NSDictionary *linkInfo;

// Method for segmented control of mapView map type
-(IBAction)onChange:(id)sender;

@end
