//
//  MoreInfoViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreInfoViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel *hotelNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *hotelDescrLabel;
@property(nonatomic, weak) IBOutlet UIImageView *hotelPic;

@property (nonatomic, strong) NSDictionary *linkInfo;

@end
