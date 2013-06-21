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
                          @{@"Hotel":@"Atlantasia", @"City":@"Atlanta", @"State":@"Georgia", @"Loc":@[@33.7489,@-84.3881], @"Image":@"atlantasia.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"The Atlantasia hotel boasts a central location in the heart of downtown Atlanta within walking distance of some of the best attractions in the city, including the Georgia Aquarium, CNN Center and the Georgia World Congress Center."},
                          @{@"Hotel":@"The Bostonian", @"City":@"Boston", @"State":@"Massachusetts", @"Loc":@[@42.3583,@-71.0603], @"Image":@"the-bostonian.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"Perfectly located near Boston’s cultural attractions like Faneuil Hall and business district, this hotel is just 2.5 miles from Logan Airport."},
                          @{@"Hotel":@"Tropicana", @"City":@"Cabo San Lucas", @"State":@"Mexico", @"Loc":@[@22.8858,@-109.9150], @"Image":@"tropicana.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"The beach resort is reached via the only privately owned tunnel in Mexico, Dos Mares. Carved through the heart of the mountain, the tunnel is a 300-meter long engineering feat that separates the town of Cabo from the Pacific Ocean."},
                          @{@"Hotel":@"NewYorker", @"City":@"New York City", @"State":@"New York", @"Loc":@[@40.7142,@-74.0064], @"Image":@"newyorker.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"4 Diamond downtown hotel with indoor pool, in the New York Financial district, close to Wall Street, World Trade Center, Century 21 & Statue of Liberty."},
                          @{@"Hotel":@"Orlandian", @"City":@"Orlando", @"State":@"Florida", @"Loc":@[@28.5381,@-81.3794], @"Image":@"orlandian.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"Upscale Resort with 2 pools, lazy river, water slide, cabana & spa. Free shuttle to SeaWorld. Minutes to Walt Disney World® Resort & Universal Orlando."},
                          @{@"Hotel":@"Nashvillage", @"City":@"Nashville", @"State":@"Tennessee", @"Loc":@[@36.1658,@-86.7844], @"Image":@"nashvillage.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"Located in the heart of downtown, this hotel is the only AAA 4-Diamond, full service, luxury hotel in the city, while 10 minutes from the airport."},
                          @{@"Hotel":@"Los Ango", @"City":@"Los Angelos", @"State":@"California", @"Loc":@[@34.05222,@-118.2428], @"Image":@"los-ango.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"A Forbes® four star Beverly Hills hotel walking distance to Rodeo Drive combines Old Hollywood with the unparalleled elegance of Beverly Hills."},
                          @{@"Hotel":@"The Dallaso", @"City":@"Dallas", @"State":@"Texas", @"Loc":@[@32.7828,@-96.8039], @"Image":@"the-dallaso.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"Boutique hotel feel with legendary bons hotels service. Luxury accommodations located in upscale Park Cities area, near SMU, downtown, and NorthPark Center."},
                          @{@"Hotel":@"Cozume", @"City":@"Cozumel", @"State":@"Mexico", @"Loc":@[@20.5000,@-86.9500], @"Image":@"cozume.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"The hotel is located just a short block from the downtown piers and three short blocks from the central Plaza. Restaurants, cafes, dive shops and shopping are all within easy walking distance."},
                          @{@"Hotel":@"Chitown", @"City":@"Chicago", @"State":@"Illinois", @"Loc":@[@41.8500,@-87.6500], @"Image":@"chitown.jpg", @"Pictures":@[@"pic-1.jpg",@"pic-2.jpg",@"pic-3.jpg",@"pic-4.jpg",@"pic-5.jpg"], @"Description":@"Stunning interiors, expansive rooms and suites, gracious service and distinctive amenities including fireplaces, terraces and complimentary WiFi await."},
                          nil];
    }
    return self;
}

@end
