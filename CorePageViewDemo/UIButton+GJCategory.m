//
//  UIButton+GJCategory.m
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/19.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import "UIButton+GJCategory.h"

@implementation UIButton(GJCategory)

+ (UIButton *)buttonWithType:(UIButtonType)type
					   title:(NSString *)title
                   titleFont:(UIFont *)titleFont
					   frame:(CGRect)frame
                       image:(UIImage *)image
             backgroundColor:(UIColor *)bColor
					  target:(id)target 
					  action:(SEL)selector 
						 tag:(NSInteger)tag
{
	UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.layer.masksToBounds = YES;
	button.frame = frame;
	if (title)
    {
		[button setTitle:title forState:UIControlStateNormal];
	}
    if (titleFont)
    {
        button.titleLabel.font = titleFont;
    }
    if (image)
    {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (bColor)
    {
        [button setBackgroundColor:bColor];
    }
    if (target && selector)
    {
        [button addTarget:target
                   action:selector
         forControlEvents:UIControlEventTouchUpInside];
    }
    if (tag)
    {
        button.tag = tag;
    }
	return button;
}

+ (UIButton *)commonButtonWithTitle:(NSString *)title
                    titleFont:(UIFont *)titleFont
                        frame:(CGRect)frame
                       target:(id)target
                       action:(SEL)action
{
    UIButton * commonBtn = [self buttonWithType:UIButtonTypeCustom
                                          title:title
                                      titleFont:titleFont
                                          frame:frame
                                          image:nil
                                backgroundColor:rgba(242, 78, 76, 1)
                                         target:target
                                         action:action
                                            tag:0];
    [commonBtn setTitleColor:rgba(255, 255, 255, 1) forState:UIControlStateNormal];
    [commonBtn setTitleColor:rgba(255, 255, 255, 0.4) forState:UIControlStateDisabled];
    [commonBtn addHiglihtedImage];
    commonBtn.layer.cornerRadius = 4.0f;
    return commonBtn;
}

- (void)addHiglihtedImage
{
    if (!CGRectEqualToRect(CGRectZero, self.bounds))
    {
        UIImage * bgImage = [rgba(0, 0, 0, 0.1) colorImageWithSize:self.bounds.size];
        [self setBackgroundImage:bgImage forState:UIControlStateHighlighted];
    }
}

@end