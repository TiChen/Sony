//
//  SNHomeCategoryCell.m
//  SonyApp
//
//  Created by Chen on 16/4/19.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNHomeCategoryCell.h"
#import "SDCycleScrollView.h"

#import "SNKvTool.h"
#import "SNHomePageModel.h"
#import "MJExtension.h"

#define BaseURL @"http://api.budejie.com/api/api_open.php"
@interface SNHomeCategoryCell ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>
{
        UIView *_backView1;
        UIView *_backView2;
    
}
@property (nonatomic,strong)NSMutableArray *imagesURLStrings;
@end

@implementation SNHomeCategoryCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSMutableArray *)menuArray{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 184)];
        _backView1.backgroundColor =[ UIColor redColor];
        [self addSubview:_backView1];
        [self setKvBanner];
    }

    return self;
    
}

// 设置轮播
-(void)setKvBanner{

    _imagesURLStrings = [NSMutableArray array];
    SNKvTool *tool = [[SNKvTool alloc]init];
    [tool getKvData:^(NSArray *array) {
        for (NSInteger i = 0;i<array.count-20;i++) {
            
            SNHomePageModel *model = array[i];
            NSString *url = model.icon;
   
            [_imagesURLStrings addObject:url];
        
        }
        
    // 网络加载 --- 创建带标题的图片轮播器
    CGFloat cycleY = 0;
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,cycleY, SCREEN_WIDTH, 184) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //    cycleScrollView2.titlesGroup = titles;

    [_backView1 addSubview:cycleScrollView];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        cycleScrollView.imageURLStringsGroup = _imagesURLStrings;
    });
    
    //     block监听点击方式
    
    cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
        CZLog(@">>>>>  %ld", (long)index);
    };
        
      }];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
