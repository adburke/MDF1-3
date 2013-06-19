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
                         @{@"Hotel":@"Atlantasia", @"Location":@"Lengyel, Eric", @"Published":@"2012", @"Url":@"http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=365853&site=ehost-live"},
                         nil];
    }
    return self;
}

@end
