//
//  UITextField+GJCategory.h
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/19.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (GJCategory)

+ (UITextField *)textFieldWithFrame:(CGRect)frame
						borderStyle:(UITextBorderStyle)borderStyle
						  textColor:(UIColor *)textColor
					backgroundColor:(UIColor *)backgroundColor
							   font:(UIFont *)font
					   keyboardType:(UIKeyboardType)keyboardType
					  returnKeyType:(UIReturnKeyType)returnKeyType
                        placeholder:(NSString *)placeholder
								tag:(NSInteger)tag 
                           delegate:(id)delegate;

+ (UITextField *)commonTextFieldWithFrame:(CGRect)frame
                                textColor:(UIColor *)textColor
                                     font:(UIFont *)font
                             keyboardType:(UIKeyboardType)keyboardType
                              placeHolder:(NSString *)placeHolder
                               secureText:(BOOL)secureText
                                 delegate:(id)delegate;

@end
