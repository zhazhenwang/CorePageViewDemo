//
//  UIColor+GJCategory.m
//  GJB4iPhone
//
//  Created by 查震旺 on 15/10/2.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import "UIColor+GJCategory.h"

@implementation UIColor (GJCategory)

+ (UIColor *)colorWithHex:(long)hex
{
    return [self colorWithHex:hex alpha:1.0f];
}

+ (UIColor *)colorWithHex:(long)hex alpha:(float)opacity
{
    float red   = ((float)((hex & 0xFF0000) >> 16)) / 255.0;
    float green = ((float)((hex & 0xFF00) >> 8)) / 255.0;
    float blue  = ((float)(hex & 0xFF)) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

- (UIImage *)colorImageWithSize:(CGSize)size
{
    CGRect drawRect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(drawRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, drawRect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
