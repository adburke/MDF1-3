//
//  LocationsManager.h
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationsManager : NSObject

@property(nonatomic, strong) NSMutableArray *locationsArray;

+(LocationsManager*)sharedInstance;

@end
