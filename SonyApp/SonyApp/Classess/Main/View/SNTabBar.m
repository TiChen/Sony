//
//  SNTabBar.m
//  SonyApp
//
//  Created by Chen on 16/4/16.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNTabBar.h"


@interface SNTabBar ()


@property (nonatomic,weak)UIButton *pulsButton;

@end

@implementation SNTabBar
// 自定义控件都要重写这个
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        // 注释了.PULSButton
//        //tabbar背景图片
//         [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
//        
//        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [plusButton setBackgroundImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
//        [plusButton setTitle:@"+" forState:UIControlStateNormal];
//        plusButton.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
//        plusButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//        [plusButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//        [plusButton setTitleColor:MYColor forState:UIControlStateSelected];
//        [self addSubview:plusButton];
//        self.pulsButton = plusButton;// 创建新的按钮
//        
        
    }
    return self;
}


////布局子控件   (// 注释了.PULSButton)
//-(void)layoutSubviews{
//    
//    [super layoutSubviews];
//    
//    // 设置自定义的添加按钮的frame
//    // 类扩展
////    self.pulsButton.frame = CGRectMake(0, 0, self.pulsButton.currentBackgroundImage.size.width, self.pulsButton.currentBackgroundImage.size.height);
////    self.pulsButton.center = CGPointMake(self.frame.size.width , self.frame.size.height);
//    
//    CGFloat buttonW = self.frame.size.width /  4;
//    CGFloat buttonH = self.frame.size.height;
//    CGFloat buttonY = 0;
//    NSInteger index = 0;// 第0个
//    // 设置其他按钮的frame
//    for (UIView *btn in self.subviews) {
//        
//        
////        if (![btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;// 不是这个类型.就设置这个类型的按钮
//        
//        if (![btn isKindOfClass:[UIControl class]] || btn == self.pulsButton) continue; //如果你不是继承uicontrol或者按钮是plus 就continue
//        
//        CGFloat buttonX = buttonW * (index > 2? (index + 1): index);
//        btn.frame = CGRectMake(buttonX , buttonY, buttonW, buttonH);
//        
//        self.pulsButton.frame = CGRectMake(buttonW * (index>2?index - 1:index), 0, buttonW, buttonH);
//        
//        index ++;
//    }


    
    
//}

@end
