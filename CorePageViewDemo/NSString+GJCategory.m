//
//  NSString+GJCategory.m
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/20.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import "NSString+GJCategory.h"

@implementation NSString (GJCategory)

- (CGSize)boundingRectWithSize:(CGSize)size
                    attributes:(NSDictionary *)attributes
                          font:(UIFont *)font
                 lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize strSize = CGSizeZero;
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        NSMutableDictionary * attrDict = [NSMutableDictionary dictionary];
        if (attributes)
        {
            [attrDict addEntriesFromDictionary:attributes];
        }
        NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
        style.lineBreakMode = lineBreakMode;
        [attrDict setObject:style forKey:NSParagraphStyleAttributeName];
        [attrDict setObject:font  forKey:NSFontAttributeName];
        strSize = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attrDict
                                     context:nil].size;
    }
    else
    {
        strSize = [self sizeWithFont:font
                   constrainedToSize:size
                       lineBreakMode:lineBreakMode];
    }
    
    return strSize;
}

+ (NSString *)stringFromHTMLString:(NSString *)htmlStr
{
    NSString * pattern = @"(?![^>]*(?=<))(?=left|top|align|title|style|class|alt)\b[^\\s]+=\"[^\"]*\"?(?=\\s|>)";
    NSError * error = nil;
    NSRegularExpression * regExp = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                             options:0
                                                                               error:&error];
    if (error)
    {
        return nil;
    }
   
    NSString * convertedStr = [regExp stringByReplacingMatchesInString:htmlStr
                                                               options:0
                                                                 range:NSMakeRange(0, htmlStr.length)
                                                          withTemplate:@""];
    
    return convertedStr;
}

@end
