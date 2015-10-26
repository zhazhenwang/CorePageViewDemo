//
//  NSDate+GJCategory.m
//  GJB4iPhone
//
//  Created by 查震旺 on 15/9/19.
//  Copyright © 2015年 guojinbao. All rights reserved.
//

#import "NSDate+GJCategory.h"

@implementation NSDate(GJCategory)

- (NSUInteger)getDay
{
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
	return [dayComponents day];
}

- (NSUInteger)getMonth
{
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
	return [dayComponents month];
}

- (NSUInteger)getYear
{
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:self];
	return [dayComponents year];
}

- (NSUInteger)getHour
{
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
	NSDateComponents * components = [calendar components:unitFlags fromDate:self];
	NSInteger hour = [components hour];
	return hour;
}

- (NSUInteger)getMinute
{
	NSCalendar * calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
	NSDateComponents * components = [calendar components:unitFlags fromDate:self];
	NSInteger minute = [components minute];
	return minute;
}

+ (NSDate *)dateFromString:(NSString *)dateStr
{
	NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * desDate = [formatter dateFromString:dateStr];
	return desDate;
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    return [self stringFromDate:date format:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString * strDate = [formatter stringFromDate:date];
    return strDate;
}

+ (NSDate *)localeDate
{
    NSDate * date = [NSDate date];
    NSTimeZone * zone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//上海时区
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate * localDate = [date  dateByAddingTimeInterval:interval];
    return localDate;
}

+ (NSTimeInterval)localeTimeInterval
{
    return [[self localeDate] timeIntervalSince1970];
}

@end
