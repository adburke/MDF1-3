//
//  MapAnnotation.h
//  testApp
//
//  Created by Aaron Burke on 6/20/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;
@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(id)initWithInfo:(NSString*)titleText subText:(NSString*)subText coord:(CLLocationCoordinate2D)coord;

@end
