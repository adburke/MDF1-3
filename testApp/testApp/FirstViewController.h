//
//  FirstViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/17/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationsManager.h"

@interface FirstViewController : UIViewController <UITableViewDelegate>

@property(nonatomic, weak) IBOutlet UITableView *mainTable;

@property(nonatomic, strong) LocationsManager *locationShare;

@end
