//
//  FirstViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/17/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationsManager.h"

// Deletgate for passing info on a cell
@protocol TableInfoDelegate <NSObject>

@optional
// Required method that will be passed the corresponding dictionary from the cell selected
- (void)viewSelectedInfo:(NSDictionary*)cellInfo;

@end

@interface FirstViewController : UIViewController <UITableViewDelegate>

@property(nonatomic, weak) IBOutlet UITableView *mainTable;

// Singleton data holder
@property(nonatomic, strong) LocationsManager *locationShare;

// Property id of the delegate
@property (nonatomic, weak) id <TableInfoDelegate> delegate;

// Controls the click even of the edit button
-(void)onClick:(id)sender;

@end
