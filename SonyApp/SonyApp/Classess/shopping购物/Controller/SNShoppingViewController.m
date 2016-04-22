//
//  SNShoppingViewController.m
//  SonyApp
//
//  Created by Chen on 16/4/16.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNShoppingViewController.h"

@interface SNShoppingViewController ()

@end

@implementation SNShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"购物商城";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"near"] highImage:[UIImage imageNamed:@"cast"] target:self action:@selector(cc ) forControlEvents:UIControlEventTouchUpInside];
    
    
    LogFunc;
}
-(void)cc{
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end
