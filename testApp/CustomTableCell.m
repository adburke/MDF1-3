//
//  CustomTableCell.m
//  testApp
//
//  Created by Aaron Burke on 6/19/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Code found to edit location of edit objects
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.0f];
    
    for (UIView *subview in self.subviews) {
        
        
        if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
            CGRect newFrame = subview.frame;
            newFrame.origin.x = 665;
            newFrame.origin.y = 48;
            subview.frame = newFrame;
        }
        else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellEditControl"]) {
            CGRect newFrame = subview.frame;
            newFrame.origin.x = 10;
            newFrame.origin.y = 48;
            subview.frame = newFrame;
        }
    }
    [UIView commitAnimations];
}

@end
