//
//  UIView+GJCategory.h
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/19.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GJCategory)

/**
 *  获取View的frame参数
 */
- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

/**
 *  设置View的frame参数
 */
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

@end
