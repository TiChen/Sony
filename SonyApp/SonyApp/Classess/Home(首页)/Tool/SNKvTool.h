//
//  SNKvTool.h
//  SonyApp
//
//  Created by Chen on 16/4/21.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNKvTool : NSObject


/**
 *  KV的工具类,从网上获取数据,将返回的数据存储到block中,回调
 *
 *  获取kv图片数据
 *
 *  @param block 回调
 */
-(void)getKvData:(void(^)(id json))block;
@end
