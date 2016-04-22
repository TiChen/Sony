//
//  SNHomeCategoryCell.h
//  SonyApp
//
//  Created by Chen on 16/4/19.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol HomeCategoryDelegate <NSObject>

@optional
-(void)homeMenuDidSelectedAtIndex:(NSInteger)index;

@end
@interface SNHomeCategoryCell : UITableViewCell


@property (nonatomic, assign) id<HomeCategoryDelegate> delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSMutableArray *)menuArray;

@end
