//
//  MineViewController.m
//  我的分界面
//
//  Created by 可乐 on 14-3-12.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UILabel * alable = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 150, 80)];
    [alable setBackgroundColor:[UIColor lightGrayColor]];
    [alable setText:@" 我的页面"];
    [self.view addSubview:alable];
    [alable release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
