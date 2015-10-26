//
//  UILabel+GJCategory.m
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/19.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import "UILabel+GJCategory.h"

@implementation UILabel (GJCategory)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
                       font:(UIFont *)font
                        tag:(NSInteger)tag
                  hasShadow:(BOOL)hasShadow
{
	UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.adjustsFontSizeToFitWidth = YES;
    label.backgroundColor = [UIColor clearColor];
    if (text)
    {
        label.text = text;
    }
    if (textColor)
    {
        label.textColor = textColor;
    }
    if (textAlignment)
    {
        label.textAlignment = textAlignment;
    }
    if (font)
    {
        label.font = font;
    }
    if (tag)
    {
        label.tag = tag;
    }
	if (hasShadow)
    {
		label.shadowColor  = [UIColor blackColor];
		label.shadowOffset = CGSizeMake(0,1);
	}
	return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
{
    UILabel * label = [self labelWithFrame:frame
                                      text:text
                                 textColor:textColor
                             textAlignment:NSTextAlignmentLeft
                                      font:font
                                       tag:0
                                 hasShadow:NO];
    return label;
}

- (CGSize)calculateSize:(CGSize)constraintSize
{
    return [self.text boundingRectWithSize:constraintSize
                                attributes:nil
                                      font:self.font
                             lineBreakMode:self.lineBreakMode];
}

@end
