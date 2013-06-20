//
//  MapAnnotation.m
//  testApp
//
//  Created by Aaron Burke on 6/20/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

-(id)initWithInfo:(NSString*)titleText subText:(NSString*)subText coord:(CLLocationCoordinate2D)coord
{
    if ((self = [super init])) {
        self.title = titleText;
        self.subtitle = subText;
        self.coordinate = coord;
    }
    return self;
}

@end
