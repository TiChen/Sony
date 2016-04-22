//
//  SNCategoryView.m
//  SonyApp
//
//  Created by Chen on 16/4/18.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNCategoryView.h"
#import "SNSquareTool.h"
#import "SNSquareButton.h"
//#import "SNWebviewController.h"


@implementation SNCategoryView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        [self createItems];
    }
    return self;
}

//创建按钮
-(void)createItems {
    
    
    //一共4列
    NSInteger maxCols = 4;
    CGFloat btnW = (SCREEN_WIDTH -(maxCols - 1) )/maxCols;
//    CGFloat btnW = SCREEN_WIDTH / maxCols;
    CGFloat btnH = btnW;
    SNSquareTool *tool = [[SNSquareTool alloc]init];
    CZLog(@"111");
    
    [tool getSquareData:^(NSArray *squareItems){
        
        for (NSInteger i = 0; i < squareItems.count; i++){
            SNSquareButton *button = [[SNSquareButton alloc]init];
            button.square = squareItems[i];
            NSInteger col = i % maxCols;//第几列
            NSInteger row = i / maxCols;//第几行
            CGFloat btnX = col * btnW;// 2 * W
            CGFloat btnY = row * btnH;
            button.frame = CGRectMake(btnX, btnY, btnW, btnH);
            [self addSubview:button];
//             监听button的点击..把按钮点击事件转换为信号，点击按钮，就会发送信号..返回一个按钮被点击了的信号
//            [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(XFSquareButton *button){
//                if (![button.square.url hasPrefix:@"http"]) return;// 如果button的URL 没有http的前缀,返回
//                XFWebviewController *web = [[XFWebviewController alloc]init];
//                web.url = button.square.url;
//                web.title = button.square.name;
//                // 取出当前的导航控制器
//                UITabBarController *tabBarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//                UINavigationController *nav = (UINavigationController *)tabBarVc.selectedViewController;
//                [nav pushViewController:web animated:YES];
//            }];
        }
        //算出footer的高度
        self.height = (squareItems.count + maxCols - 1)/(maxCols *  btnH);
        [self setNeedsDisplay];//自动画
        CZLog(@"%f",self.height);
    }];

}


@end
