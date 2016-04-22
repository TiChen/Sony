//
//  SNViewController.m
//  SonyApp
//
//  Created by Chen on 16/4/14.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNViewController.h"

@interface SNViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (weak, nonatomic)UIWebView *webView;
@end

@implementation SNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"666" style:UIBarButtonItemStylePlain target:self action:@selector(chao)];
    self.navigationItem.leftBarButtonItem=left;
    
//    // 设置全局的颜色.标识,拿到所有的外观设置. ui控件都可以
////    UITabBarItem *item = [UITabBarItem appearance];// 但是不严谨.如果只想该自己的类中的,就不行.
//    //    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];//获取当前这个类下面的所有tabbarItem
//    [left setTitleTextAttributes:@{NSForegroundColorAttributeName:MYColor} forState:UIControlStateNormal];
//
    
    NSMutableArray * lis=[NSMutableArray arrayWithCapacity:0];
    
    
    /**
     *  构建需要数据 2层或者3层数据 (ps 2层也当作3层来处理)
     */
    NSInteger countMax=10;
    for (int i=0; i<countMax; i++) {
        
        rightMeun * meun=[[rightMeun alloc] init];
        meun.meunName=[NSString stringWithFormat:@"菜单%d",i];
        NSMutableArray * sub=[NSMutableArray arrayWithCapacity:0];
        for ( int j=0; j <countMax+1; j++) {
            
            rightMeun * meun1=[[rightMeun alloc] init];
            meun1.meunName=[NSString stringWithFormat:@"%d头菜单%d",i,j];
            
            [sub addObject:meun1];
            
            //meun.meunNumber=2;
            
            NSMutableArray *zList=[NSMutableArray arrayWithCapacity:0];
            if (j%2==0) {
                
                for ( int z=0; z <countMax+2; z++) {
                    
                    rightMeun * meun2=[[rightMeun alloc] init];
                    meun2.meunName=[NSString stringWithFormat:@"%d层菜单%d",j,z];
                    
                    [zList addObject:meun2];
                    
                }
            }
            
            meun1.nextArray=zList;
        }
            
        meun.nextArray=sub;
        [lis addObject:meun];
    }
    
    /**
     *  适配 ios 7 和ios 8 的 坐标系问题
     */
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    /**
     默认是 选中第一行
     
     :returns: <#return value description#>
     */
    MultilevelMenu * view=[[MultilevelMenu alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) WithData:lis withSelectIndex:^(NSInteger left, NSInteger right,rightMeun* info) {
        
        // 跳转
        CZLog(@"点击的 菜单%@",info.meunName);
    }];
    
    
    view.needToScorllerIndex=0;
    
    view.isRecordLastScroll=YES;
    [self.view addSubview:view];
    
}


-(void)chao {
    CZLog(@"66");
    
}


@end
