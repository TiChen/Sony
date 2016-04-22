//
//  SNSquareTool.m
//  SonyApp
//
//  Created by Chen on 16/4/18.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNSquareTool.h"
#import "HttpTool.h"
#import "SNSquare.h"
#import "MJExtension.h"

#define BaseURL @"http://api.budejie.com/api/api_open.php"


@implementation SNSquareTool

// 获取方块的数据然后用block回调
-(void)getSquareData:(void (^)(id))block {
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"square";//key  value
    params[@"c"] = @"topic";
    
    
    [HttpTool get:BaseURL parameters:params success:^(id json) {
        
        NSArray *squareArray = [SNSquare mj_objectArrayWithKeyValuesArray:json[@"square_list"]];// (字典数组名称)字典数组->模型数组
//         CZLog(@"SquareTool-网络请求的数据%@",squareArray);// 对象
        block(squareArray);
        
    } failure:^(NSError *error) {
        nil;
    }];
    
}


@end
