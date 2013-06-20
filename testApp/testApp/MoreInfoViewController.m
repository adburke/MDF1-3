//
//  MoreInfoViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/18/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "MoreInfoViewController.h"
#import "CVCellController.h"

@interface MoreInfoViewController ()

@end

@implementation MoreInfoViewController

@synthesize linkInfo, hotelDescrLabel, hotelNameLabel, hotelPic;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewSelectedInfo:(NSDictionary*)cellInfo
{
    self.linkInfo = cellInfo;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[linkInfo objectForKey:@"Pictures"] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cvCell";
    CVCellController *cell = (CVCellController *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
    NSArray *pictures = [linkInfo objectForKey:@"Pictures"];
    cell.pictureHolder.image = [UIImage imageNamed:pictures[indexPath.row]];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    hotelNameLabel.text = linkInfo[@"Hotel"];
    hotelPic.image = [UIImage imageNamed:linkInfo[@"Image"]];
    
    [self.collectionView registerClass:[CVCellController class] forCellWithReuseIdentifier:@"cvCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

