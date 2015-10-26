//
//  UIColor+GJCategory.h
//  GJB4iPhone
//
//  Created by 查震旺 on 15/10/2.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GJCategory)

+ (UIColor *)colorWithHex:(long)hex;

+ (UIColor *)colorWithHex:(long)hex alpha:(float)opacity;

- (UIImage *)colorImageWithSize:(CGSize)size;

@end
