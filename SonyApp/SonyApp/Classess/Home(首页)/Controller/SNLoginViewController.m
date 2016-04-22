//
//  SNLoginViewController.m
//  SonyApp
//
//  Created by Chen on 16/4/14.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNLoginViewController.h"
#import "UIBarButtonItem+Item.h"
#import "SNLoginSuccessViewController.h"
@interface SNLoginViewController ()

@end

@implementation SNLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"music"] highImage:[UIImage imageNamed:@"movie"] target:self action:@selector(pop ) forControlEvents:UIControlEventTouchUpInside];
//    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"more"] highImage:[UIImage imageNamed:@"hot_status"] target:self action:@selector(root) forControlEvents:UIControlEventTouchUpInside];
    
    
    //实现滑动返回功能
    
}


-(void)root{
    
    SNLoginSuccessViewController  *success = [[SNLoginSuccessViewController alloc]init];
    [self.navigationController pushViewController:success animated:YES];
    
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
