//
//  UIImage+image.m
//  SonyApp
//
//  Created by Chen on 16/4/12.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)
/**
 *  加载没有渲染的图片
 *
 */
+(instancetype)imageWithOriginalName:(NSString *)imageName
{
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}
/**
 *  加载不拉伸的图片
 *
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+(instancetype)imageWithStretchableName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width *0.5 topCapHeight:image.size.height * 0.5];
    
    
    
    
}

@end
