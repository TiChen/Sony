//
//  SNLoginSuccessViewController.m
//  SonyApp
//
//  Created by Chen on 16/4/14.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNLoginSuccessViewController.h"
#import "UIBarButtonItem+Item.h"

@interface SNLoginSuccessViewController ()

@end

@implementation SNLoginSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"more"] highImage:[UIImage imageNamed:@"hot_status"] target:self action:@selector(root) forControlEvents:UIControlEventTouchUpInside];
    

   
}

-(void)root{
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
