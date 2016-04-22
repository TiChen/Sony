//
//  SNSquareTool.h
//  SonyApp
//
//  Created by Chen on 16/4/18.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNSquareTool : NSObject

/**
 *  方块的工具类,从网上获取数据,将返回的数据存储到block中,回调
 *
 *  获取广场方块数据
 *
 *  @param block 回调
 */
-(void)getSquareData:(void(^)(id json))block;

@end
