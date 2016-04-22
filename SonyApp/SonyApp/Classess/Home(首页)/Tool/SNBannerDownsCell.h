//
//  SNBannerDownsCell.h
//  SonyApp
//
//  Created by Chen on 16/4/19.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SNBannerDownsCellDelegate <NSObject>
@optional
-(void)homeMenuDidSelectedAtIndex:(NSInteger)index;

-(void)cellWithHeight:(CGFloat)value;

@end

@interface SNBannerDownsCell : UITableViewCell


@property (nonatomic, assign) id<SNBannerDownsCellDelegate> delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSMutableArray *)menuArray;

@end
