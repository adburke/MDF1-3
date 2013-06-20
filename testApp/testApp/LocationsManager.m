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
                          @{@"Hotel":@"Atlantasia", @"City":@"Atlanta", @"State":@"Georgia", @"Loc":@[@33.7489,@-84.3881], @"Image":@"atlantasia.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"The Bostonian", @"City":@"Boston", @"State":@"Massachusetts", @"Loc":@[@42.3583,@-71.0603], @"Image":@"the-bostonian.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"Tropicana", @"City":@"Cabo San Lucas", @"State":@"Mexico", @"Loc":@[@22.8800,@-109.9000], @"Image":@"tropicana.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"NewYorker", @"City":@"New York City", @"State":@"New York", @"Loc":@[@40.7142,@-74.0064], @"Image":@"newyorker.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          nil];
    }
    return self;
}

@end
