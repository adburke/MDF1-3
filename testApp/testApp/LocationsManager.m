//
//  LocationsManager.m
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "LocationsManager.h"

@implementation LocationsManager


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
        self.locationsArray = [[NSMutableArray alloc] initWithObjects:
                          @{@"Hotel":@"Atlantasia", @"City":@"Atlanta", @"State":@"Georgia", @"Loc":@[@33.7489,@-84.3881], @"Image":@"atlantasia.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"The Bostonian", @"City":@"Boston", @"State":@"Massachusetts", @"Loc":@[@42.3583,@-71.0603], @"Image":@"the-bostonian.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"Tropicana", @"City":@"Cabo San Lucas", @"State":@"Mexico", @"Loc":@[@22.8858,@-109.9150], @"Image":@"tropicana.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"NewYorker", @"City":@"New York City", @"State":@"New York", @"Loc":@[@40.7142,@-74.0064], @"Image":@"newyorker.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"Orlandian", @"City":@"Orlando", @"State":@"Florida", @"Loc":@[@28.5381,@-81.3794], @"Image":@"orlandian.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"Nashvillage", @"City":@"Nashville", @"State":@"Tennessee", @"Loc":@[@36.1658,@-86.7844], @"Image":@"nashvillage.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"Los Ango", @"City":@"Los Angelos", @"State":@"California", @"Loc":@[@34.05222,@-118.2428], @"Image":@"los-ango.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"The Dallaso", @"City":@"Dallas", @"State":@"Texas", @"Loc":@[@32.7828,@-96.8039], @"Image":@"the-dallaso.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"Cozume", @"City":@"Cozumel", @"State":@"Mexico", @"Loc":@[@20.5000,@-86.9500], @"Image":@"cozume.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          @{@"Hotel":@"Chitown", @"City":@"Chicago", @"State":@"Illinois", @"Loc":@[@41.8500,@-87.6500], @"Image":@"chitown.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"]},
                          nil];
    }
    return self;
}

@end
