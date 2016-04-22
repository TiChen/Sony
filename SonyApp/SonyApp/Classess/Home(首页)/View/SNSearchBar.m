//
//  SNSearchBar.m
//  SonyApp
//
//  Created by Chen on 16/4/14.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNSearchBar.h"

@implementation SNSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

        self.font = [UIFont systemFontOfSize:12];
        self.background = [UIImage imageWithStretchableName: @"searchbar_textfield_background"];
        
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];// 默认uiimageView和图片一样大
        imageV.width += 10;
        imageV.contentMode = UIViewContentModeCenter;
        self.leftView =  imageV;
        self.leftViewMode = UITextFieldViewModeAlways;// 左边视图搜索的模式
        self.clearButtonMode = UITextFieldViewModeAlways;
//        self.secureTextEntry = YES;// 密码小圆点
        
    }
    return self;
}

@end
