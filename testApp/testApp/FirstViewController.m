//
//  FirstViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/17/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "FirstViewController.h"
#import "MoreInfoViewController.h"
#import "CustomTableCell.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize mainTable, locationShare, delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"bons hôtels", @"bons hôtels");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.tabBarItem.title = NSLocalizedString(@"Hotel List", @"Hotel List");
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onClick:)];
    }
    return self;
}
							
- (void)viewDidLoad
{
    locationShare = [LocationsManager sharedInstance];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button) {
        if ([self.navigationItem.rightBarButtonItem.title isEqual:@"Edit"]) {
            [mainTable setEditing:true];
            self.navigationItem.rightBarButtonItem.title = @"Done";
            
        } else {
            [mainTable setEditing:false];
            self.navigationItem.rightBarButtonItem.title = @"Edit";
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return locationShare.locationsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    //This is the code for a base table view cell
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        // This is the code for a base table view cell
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCellView" owner:nil options:nil];
        for (UIView *view in views) {
            if ([view isKindOfClass:[CustomTableCell class]]) {
                cell = (CustomTableCell*)view;
            }
        }
    }
    // Sets label text boxes with the correct data
    cell.hotelNameLabel.text = [[locationShare.locationsArray objectAtIndex: indexPath.row] objectForKey:@"Hotel"];
    cell.hotelLocLabel.text = [NSString stringWithFormat:@"%@, %@",[[locationShare.locationsArray objectAtIndex: indexPath.row] objectForKey:@"City"], [[locationShare.locationsArray objectAtIndex: indexPath.row] objectForKey:@"State"]];
    cell.hotelPic.image = [UIImage imageNamed:[[locationShare.locationsArray objectAtIndex: indexPath.row] objectForKey:@"Image"]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Allocates and sets up the delegate for InfoViewController
    // Passes the selected row dictionary of personal data to the InfoViewController
    MoreInfoViewController *infoView = [[MoreInfoViewController alloc] initWithNibName:@"MoreInfoViewController" bundle:nil];
    if (infoView) {
        self.delegate = (id)infoView;
        [delegate viewSelectedInfo:[locationShare.locationsArray objectAtIndex: indexPath.row]];
        [self.navigationController pushViewController:infoView animated:TRUE];
    }
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Remove from array
        [locationShare.locationsArray removeObjectAtIndex:indexPath.row];
        
        // Remove from table view
        [mainTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
        
    }
}



@end
