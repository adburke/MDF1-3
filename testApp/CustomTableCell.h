//
//  CustomTableCell.h
//  testApp
//
//  Created by Aaron Burke on 6/19/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *hotelNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *hotelLocLabel;
@property(nonatomic, weak) IBOutlet UIImageView *hotelPic;

@end
