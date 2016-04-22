//
//  SNSquare.h
//  SonyApp
//
//  Created by Chen on 16/4/18.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import <Foundation/Foundation.h>


// 方块的模型数据

@interface SNSquare : NSObject
/** id */
@property (nonatomic, copy) NSString *id;
/** 图片 */
@property (nonatomic, copy) NSString *icon;
/** 标题文字 */
@property (nonatomic, copy) NSString *name;
/** 链接 */
@property (nonatomic, copy) NSString *url;
/** cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end
