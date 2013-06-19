//
//  LocationsManager.m
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "LocationsManager.h"

@implementation LocationsManager
@synthesize locationsArray;


// dispatch_once creates a thread safe singleton
+(LocationsManager*)sharedInstance;
{
    static LocationsManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LocationsManager alloc] init];
        
    });
    return _instance;
}

-(id)init
{
    if (self = [super init])
    {
        locationsArray = [[NSMutableArray alloc] initWithObjects:
                          @{@"Hotel":@"Atlantasia", @"City":@"Atlanta", @"State":@"Georgia", @"Image":@"atlantasia.jpg"},
                          @{@"Hotel":@"The Bostonian", @"City":@"Boston", @"State":@"Massachusetts", @"Image":@"the-bostonian.jpg"},
                          @{@"Hotel":@"Tropicana", @"City":@"Cabo San Lucas", @"State":@"Mexico", @"Image":@"tropicana.jpg"},
                          @{@"Hotel":@"NewYorker", @"City":@"New York City", @"State":@"New York", @"Image":@"newyorker.jpg"},
                          nil];
    }
    return self;
}

@end
