//
//  UITextField+GJCategory.m
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/19.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import "UITextField+GJCategory.h"

@implementation UITextField (GJCategory)

+ (UITextField *)textFieldWithFrame:(CGRect)frame
						borderStyle:(UITextBorderStyle)borderStyle
						  textColor:(UIColor *)textColor
					backgroundColor:(UIColor *)backgroundColor
							   font:(UIFont *)font
					   keyboardType:(UIKeyboardType)keyboardType
					  returnKeyType:(UIReturnKeyType)returnKeyType
                        placeholder:(NSString *)placeholder
								tag:(NSInteger)tag 
                           delegate:(id)delegate
{
	UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    if (textColor)
    {
        textField.textColor = textColor;
    }
	if (backgroundColor)
    {
        textField.backgroundColor = backgroundColor;
    }
    if (font)
    {
        textField.font = font;
    }
    if (placeholder)
    {
        textField.placeholder = placeholder;
    }
    if (tag)
    {
        textField.tag = tag;
    }
    if (delegate)
    {
        textField.delegate = delegate;
    }
    
    textField.borderStyle              = borderStyle;
    textField.keyboardType             = keyboardType;
    textField.returnKeyType            = returnKeyType;
    textField.tag                      = tag;
    textField.clearButtonMode          = UITextFieldViewModeWhileEditing;
    textField.autocorrectionType       = UITextAutocorrectionTypeDefault;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
	return textField;
}

+ (UITextField *)commonTextFieldWithFrame:(CGRect)frame
                                textColor:(UIColor *)textColor
                                     font:(UIFont *)font
                             keyboardType:(UIKeyboardType)keyboardType
                              placeHolder:(NSString *)placeHolder
                               secureText:(BOOL)secureText
                                 delegate:(id)delegate
{
    UITextField * textField = [self textFieldWithFrame:frame
                                           borderStyle:UITextBorderStyleNone
                                             textColor:textColor
                                       backgroundColor:[UIColor clearColor]
                                                  font:font
                                          keyboardType:keyboardType
                                         returnKeyType:UIReturnKeyDefault
                                           placeholder:placeHolder
                                                   tag:0
                                              delegate:delegate];
    
    textField.backgroundColor = rgba(255, 255, 255, 1);
    textField.secureTextEntry = secureText;
    
    UIView * spaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 19, textField.height)];
    spaceView.backgroundColor = [UIColor clearColor];
    textField.leftView = spaceView;
    textField.leftViewMode = UITextFieldViewModeAlways;
   
    UIView * topLine = [[UIView alloc] initWithFrame:CGRectMake(0, textField.y, textField.width, 0.5)];
    UIView * botLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textField.frame), textField.width, 0.5)];
    topLine.backgroundColor = rgba(229, 229, 229, 1);
    botLine.backgroundColor = rgba(229, 229, 229, 1);
    [textField addSubview:topLine];
    [textField addSubview:botLine];
    return textField;
}

@end
