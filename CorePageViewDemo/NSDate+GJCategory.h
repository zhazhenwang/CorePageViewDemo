//
//  NSDate+GJCategory.h
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/19.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GJCategory) 

/**
 *  获取日期
 */
- (NSUInteger)getDay;

/**
 *  获取月份
 */
- (NSUInteger)getMonth;

/**
 *  获取年份
 */
- (NSUInteger)getYear;

/**
 *  获取小时
 */
- (NSUInteger)getHour;

/**
 *  获取分钟
 */
- (NSUInteger)getMinute;

/**
 *  字符串转化日期
 *
 *  @param dateStr 格式化字符串 yyyy-MM-dd HH:mm:ss
 *
 *  @return 日期
 */
+ (NSDate *)dateFromString:(NSString *)dateStr;

/**
 *  日期转化字符串
 *
 *  @param date 日期
 *
 *  @return 日期字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date;

/**
 *  日期转化字符串
 *
 *  @param date   日期
 *  @param format 格式化字符串
 *
 *  @return 日期字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

/**
 *  获取系统时间
 */
+ (NSDate *)localeDate;

/**
 *  获取系统时间戳
 */
+ (NSTimeInterval)localeTimeInterval;

@end
