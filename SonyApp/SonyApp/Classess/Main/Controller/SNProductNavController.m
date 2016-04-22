//
//  SNProductNavController.m
//  SonyApp
//
//  Created by Chen on 16/4/14.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNProductNavController.h"
#import "UIBarButtonItem+Item.h"

@interface SNProductNavController ()<UINavigationControllerDelegate>

@property(nonatomic,strong)id popDelegate;

@end

@implementation SNProductNavController
// 第一次使用这个类SNProductNavController才会调用
+(void)initialize{
    
//    NSLog(@"-------%s",__func__);
    // 设置全局的颜色.标识,拿到所有的外观设置. ui控件都可以
//    UITabBarItem *item = [UITabBarItem appearance];// 但是不严谨.如果只想该自己的类中的,就不行.
        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];//获取当前这个类下面的所有tabbarItem
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:MYColor} forState:UIControlStateNormal] ;
    
    //设置背景图片///  self class  当在self这个控制器才会去设置背景图片
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forBarMetrics:UIBarMetricsDefault];
    

}
// 自定义导航并且重写
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//     CZLog(@"%lu",(unsigned long)self.childViewControllers.count);
    // 设置非根控制器导航条的内容  导航控制器里边的所有子控制器个数
    if (self.childViewControllers.count != 0 ) { //==0是根控制器
        // 设置内容
//        CZLog(@"%lu",(unsigned long)self.childViewControllers.count);
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"music"] highImage:[UIImage imageNamed:@"movie"] target:self action:@selector(pop ) forControlEvents:UIControlEventTouchUpInside];
        
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"more"] highImage:[UIImage imageNamed:@"hot_status"] target:self action:@selector(root) forControlEvents:UIControlEventTouchUpInside];

    }
//    CZLog(@"%s",__func__);
    [super pushViewController:viewController animated:animated];
    
}
-(void)pop{
    
    [self popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    self.delegate =self;
    
    // 清空滑动返回手势的代理,就能实现滑动返回..实现滑动返回.. 清空前保存了代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;

    self.interactivePopGestureRecognizer.delegate = nil;
    
}
// 导航控制器跳转完成时候调用
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
//    CZLog(@"---%@",self.viewControllers[0]);
    if (viewController == self.viewControllers[0]) {// 显示是根控制器
        
        //把滑动手势代理还原
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else{
        // 不是显示根控制器
            self.interactivePopGestureRecognizer.delegate = nil;
    }
    
}









@end
