//
//  SNKvTool.m
//  SonyApp
//
//  Created by Chen on 16/4/21.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNKvTool.h"
#import "HttpTool.h"
#import "SNHomePageModel.h"
#import "MJExtension.h"

@interface  SNKvTool ()

@property (nonatomic,strong)NSMutableArray *kvmodelarrays;

@end


@implementation SNKvTool
-(NSMutableArray *)kvmodelarrays{
    if (_kvmodelarrays  == nil) {
        _kvmodelarrays = [NSMutableArray array];
    }
    return _kvmodelarrays;
}


#define BaseURL @"http://api.budejie.com/api/api_open.php"

// 获取方块的数据然后用block回调
-(void)getKvData:(void (^)(id))block {
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"square";//key  value
    params[@"c"] = @"topic";
    
    
    [HttpTool get:BaseURL parameters:params success:^(id json) {
//        
//        NSMutableArray *squareArray = [SNHomePageModel mj_objectArrayWithKeyValuesArray:json[@"square_list"]];//key (字典数组名称)字典数组->模型数组
//        block(squareArray);
//        CZLog(@"%@",squareArray);
        
        

            self.kvmodelarrays = [SNHomePageModel mj_objectArrayWithKeyValuesArray:json[@"square_list"]];
        block(self.kvmodelarrays);
//        CZLog(@"转模型%@",self.kvmodelarrays);
        
        
        
    } failure:^(NSError *error) {
        nil;
    }];
    
}

@end
