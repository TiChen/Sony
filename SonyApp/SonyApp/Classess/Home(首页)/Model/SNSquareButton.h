//
//  SNSquareButton.h
//  SonyApp
//
//  Created by Chen on 16/4/18.
//  Copyright © 2016年 Chen. All rights reserved.
// 接受模型数据,添加给子控件squarebutton 

#import <UIKit/UIKit.h>



#import "SNSquare.h"
@interface SNSquareButton : UIButton
@property (nonatomic,strong) SNSquare *square;
@end
