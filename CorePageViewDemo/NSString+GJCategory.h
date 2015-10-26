//
//  NSString+GJCategory.h
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/20.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GJCategory)

- (CGSize)boundingRectWithSize:(CGSize)size
                    attributes:(NSDictionary *)attributes
                          font:(UIFont *)font
                 lineBreakMode:(NSLineBreakMode)lineBreakMode;

+ (NSString *)stringFromHTMLString:(NSString *)htmlStr;

@end
