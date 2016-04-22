//
//  SNTabBarController.m
//  SonyApp
//
//  Created by Chen on 16/4/12.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNTabBarController.h"
#import "UIImage+image.h"
#import "SNViewController.h"
#import "MultilevelMenu.h"
#import "SNProductNavController.h"

#import "HomeViewController.h"
#import "SNShoppingViewController.h"
#import "SNTabBar.h"


//#define MYColor [UIColor colorWithRed:135.0/255. green:206.0/255. blue:235.0/255. alpha:1.0]


@interface SNTabBarController ()

@end

@implementation SNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupAllChildViewController];
    
}
+(void)initialize{
    
    // 设置全局文字的颜色.标识,拿到所有的外观设置. ui控件都可以
  UITabBarItem *item = [UITabBarItem appearance];// 但是不严谨.如果只想该自己的类中的,就不行.
//    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];//获取当前这个类下面的所有tabbarItem
  [item setTitleTextAttributes:@{NSForegroundColorAttributeName:MYColor} forState:UIControlStateSelected];
    
}



- (void)setupAllChildViewController{
    
    HomeViewController *home = [[HomeViewController alloc]init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"Chat_GroupList_Btn_Click"] selectImage:[UIImage imageWithOriginalName:@"Chat_GroupList_Btn_Click"] title:@"首页"];// Image 关闭渲染蓝色后的显示
    
    
    SNViewController *product =[[SNViewController alloc]init];
    [self setUpOneChildViewController:product image:[UIImage imageNamed:@"Chat_GroupList_Btn_Click.tiff"] selectImage:[UIImage imageWithOriginalName:@"Chat_GroupList_Btn_HL.tiff"] title:@"产品"];
    
    
    SNShoppingViewController *goShopping = [[SNShoppingViewController alloc]init];
    [self setUpOneChildViewController:goShopping image:nil selectImage:nil title:@"购物车"];

    
    UIViewController *vip = [[UIViewController alloc]init];
    [self setUpOneChildViewController:vip image:nil selectImage:nil title:@"会员"];

    
//    UIViewController *more = [[UIViewController alloc]init];
//    [self setUpOneChildViewController:more image:nil selectImage:nil title:@"更多"];
//    
    //设置新的tabbar
    [self setValue:[[SNTabBar alloc]init] forKeyPath:@"tabBar"];
   
    

}
// 多态 父类指针指向之类对象
-(void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title
{
//    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MYColor} forState:UIControlStateSelected];
   
    
    vc.title = title;
    vc.tabBarItem.selectedImage = selectImage;// 关闭渲染图片不显示蓝色
    SNProductNavController *nav = [[SNProductNavController alloc]initWithRootViewController:vc];

    // 这句写了会直接创建所有的控制器,并加载内容.view提前创建
    //    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100. green:arc4random_uniform(100)/100. blue:arc4random_uniform(100)/100. alpha:1.0];
    

    
    [self addChildViewController:nav];
    
}



@end
