//
//  SNBannerDownsCell.m
//  SonyApp
//
//  Created by Chen on 16/4/19.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "SNBannerDownsCell.h"
#import "SNSquareTool.h"
#import "SNSquareButton.h"
#import "UIImageView+WebCache.h"
#import "SNHomePageModel.h"

@interface SNBannerDownsCell ()<UIScrollViewDelegate>
{
    UIView *_backView1;
    UIView *_backView2;
}

@property (nonatomic,strong)SNSquare *square;

@end



@implementation SNBannerDownsCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSMutableArray *)menuArray{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        _backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH ,160)];
//        _backView1.backgroundColor = [UIColor yellowColor];
        _backView1.clipsToBounds = YES;
        _backView2 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, 160)];
         _backView2.clipsToBounds = YES;
//        _backView2.backgroundColor = [UIColor grayColor];
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        scrollView.contentSize = CGSizeMake(2*SCREEN_WIDTH, 180);
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        [scrollView addSubview:_backView1];
        [scrollView addSubview:_backView2];
        [self.contentView addSubview:scrollView];
        [self setBanner];
        
        
        
        {
//        //创建8个
//        for (int i = 0; i < 20; i++) {
//            SNHomecategoryModel *categoryM = menuArray[i];// 分类的图标和文字
//            if (i < 5) {
//                CGRect frame = CGRectMake(i*SCREEN_WIDTH/5, 0, SCREEN_WIDTH/5, 80);
//                NSString *title = categoryM.category_name;
//                NSString *imageStr1 = categoryM.category_picurl;
//                NSString *imageStr = @"icon_homepage_entertainmentCategory";
//                
//                {           //                JZMenuButton *btnView = [[JZMenuButton alloc] initWithFrame:frame];
//                    //                [btnView setTitle:title forState:UIControlStateNormal];
//                    //                [btnView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//                    //                [btnView setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
//                    //                JZMTBtnView *btnView = [[JZMTBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
//                    //                btnView.tag = 10+i;
//                    //                [_backView1 addSubview:btnView];
//                    //                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
//                    //                [btnView addGestureRecognizer:tap];
//                }
//                //换掉
//                UIView *menubackView = [[UIView alloc] initWithFrame:frame];
//                menubackView.tag = 10+i;
//                [_backView1 addSubview:menubackView];
//             
//                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
//                [menubackView addGestureRecognizer:tap];
//                
//                CGFloat frameWidth = frame.size.width;
//                CGFloat frameHeight = frame.size.height;
//                //图
//                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameWidth/2-20, 20, 40, 40)];
//                [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr1] placeholderImage:[UIImage imageNamed:imageStr]];
//                [menubackView addSubview:imageView];
//               
//                //文字
//                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), frameWidth, 20)];
//                titleLabel.font = [UIFont systemFontOfSize:12];
//                titleLabel.textAlignment = NSTextAlignmentCenter;
//                titleLabel.text = title;
//                [menubackView addSubview:titleLabel];
//                
//                
//                
//                
//            }else if(i<10){
//                CGRect frame = CGRectMake((i-5)*SCREEN_WIDTH/5, 80, SCREEN_WIDTH/5, 80);
//                NSString *title = categoryM.category_name;
//                NSString *imageStr1 = categoryM.category_picurl;//
//                NSString *imageStr = @"icon_homepage_entertainmentCategory";
//                
//                //换掉
//                UIView *menubackView = [[UIView alloc] initWithFrame:frame];
//                menubackView.tag = 10+i;
//                [_backView1 addSubview:menubackView];
//                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
//                [menubackView addGestureRecognizer:tap];
//                
//                CGFloat frameWidth = frame.size.width;
//                CGFloat frameHeight = frame.size.height;
//                //图
//                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameWidth/2-20, 20, 40, 40)];
//                [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr1] placeholderImage:[UIImage imageNamed:imageStr]];
//                [menubackView addSubview:imageView];
//                //文字
//                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), frameWidth, 20)];
//                titleLabel.font = [UIFont systemFontOfSize:12];
//                titleLabel.textAlignment = NSTextAlignmentCenter;
//                titleLabel.text = title;
//                [menubackView addSubview:titleLabel];
//            }else if(i < 15){
//                CGRect frame = CGRectMake((i-10)*SCREEN_WIDTH/5, 0, SCREEN_WIDTH/5, 80);
//                NSString *title = categoryM.category_name;
//                NSString *imageStr1 = categoryM.category_picurl;
//                NSString *imageStr = @"icon_homepage_entertainmentCategory";
//                
//                //换掉
//                UIView *menubackView = [[UIView alloc] initWithFrame:frame];
//                menubackView.tag = 10+i;
//                [_backView2 addSubview:menubackView];
//                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
//                [menubackView addGestureRecognizer:tap];
//                
//                CGFloat frameWidth = frame.size.width;
//                CGFloat frameHeight = frame.size.height;
//                //图
//                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameWidth/2-20, 20, 40, 40)];
//                [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr1] placeholderImage:[UIImage imageNamed:imageStr]];
//                [menubackView addSubview:imageView];
//                //文字
//                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), frameWidth, 20)];
//                titleLabel.font = [UIFont systemFontOfSize:12];
//                titleLabel.textAlignment = NSTextAlignmentCenter;
//                titleLabel.text = title;
//                [menubackView addSubview:titleLabel];
//menubackView.backgroundColor = [UIColor redColor];
//            }else{
//                CGRect frame = CGRectMake((i-15)*SCREEN_WIDTH/5, 80, SCREEN_WIDTH/5, 80);
//                NSString *title = categoryM.category_name;
//                NSString *imageStr1 = categoryM.category_picurl;
//                NSString *imageStr = @"icon_homepage_entertainmentCategory";
//                
//                //换掉
//                UIView *menubackView = [[UIView alloc] initWithFrame:frame];
//                menubackView.tag = 10+i;
//                [_backView2 addSubview:menubackView];
//                
//                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
//                [menubackView addGestureRecognizer:tap];
//                
//                CGFloat frameWidth = frame.size.width;
//                CGFloat frameHeight = frame.size.height;
//                //图
//                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameWidth/2-20, 20, 40, 40)];
//                [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr1] placeholderImage:[UIImage imageNamed:imageStr]];
//                [menubackView addSubview:imageView];
//                //文字
//                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), frameWidth, 20)];
//                titleLabel.font = [UIFont systemFontOfSize:12];
//                titleLabel.textAlignment = NSTextAlignmentCenter;
//                titleLabel.text = title;
//                [menubackView addSubview:titleLabel];
//menubackView.backgroundColor = [UIColor yellowColor];
//            }
//        }
//
        }
    }
    return self;
}

-(void)setBanner{

    
    //    //一共4列
        NSInteger maxCols = 7;
        CGFloat btnW = (SCREEN_WIDTH -(maxCols - 1) ) / maxCols;
    
        CGFloat btnH = btnW;
        SNSquareTool *tool = [[SNSquareTool alloc]init];
CZLog(@"%s1",__func__);
        [tool getSquareData:^(NSArray *squareItems) {
CZLog(@"%lu",(unsigned long)squareItems.count);

            for (NSInteger i = 0; i < squareItems.count; i++) {
                SNSquareButton *button = [[SNSquareButton alloc]init];
                button.square = squareItems[i];
            
                NSInteger col = i % maxCols;//第几列
                NSInteger row = i / maxCols;//第几行
                CGFloat btnX = col * btnW;
                CGFloat btnY = row * btnH;
                button.frame = CGRectMake(btnX, btnY, btnW, btnH);
                button.tag  += i;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtn:)];
                [button addGestureRecognizer:tap];
                if (i < 21) {
                    
                    [_backView1 addSubview:button];
                }else{
                    
                    CGFloat btnY = (row - 3)* btnH;
                    button.frame = CGRectMake(btnX, btnY, btnW, btnH);
                    
                    [_backView2 addSubview:button];
                }
            }
    //        //算出cell的高度
//            _backView1.height = (squareItems.count + maxCols - 1)/maxCols *  btnH;
//            [self setNeedsDisplay];
            CZLog(@"2...--%fxxxxxxx",_backView1.height);
            
            [self.delegate cellWithHeight:_backView1.height];
        }];
    
        CZLog(@"3");
    

}

-(void)OnTapBtn:(UITapGestureRecognizer *)sender{
    CZLog(@"tag:%d",sender.view.tag);
    //    [self.delegate homeMenuDidSelectedAtIndex:sender.view.tag];
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
