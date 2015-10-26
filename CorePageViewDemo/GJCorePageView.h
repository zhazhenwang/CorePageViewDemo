//
//  GJCorePageView.h
//  GJB4iPhone
//
//  Created by macbook on 15/9/17.
//  Copyright (c) 2015年 zhenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GJCorePageView;

@protocol GJCorePageViewDelegate <NSObject>

@optional

/**
 *  切换页面
 *
 *  @param corePageView GJCorePageView对象
 *
 *  @param toIndex      目标页面
 */
- (void)corePageView:(GJCorePageView *)corePageView didSwitchPageIndexTo:(NSInteger)toIndex;

@end

@protocol GJCorePageViewDataSource <NSObject>

@required

/**
 *  分页数量
 *
 *  @param corePageView GJCorePageView对象
 *
 *  @return 分页数量
 */
- (NSInteger)numberOfPagesInCorePageView:(GJCorePageView *)corePageView;

/**
 *  顶部标题列表
 *
 *  @param corePageView GJCorePageView对象
 *
 *  @return 标题列表
 */
- (NSArray *)titlesInTopBarOfCorePageView:(GJCorePageView *)corePageView;

/**
 *  分页数据源
 *
 *  @param corePageView GJCorePageView对象
 *  @param pageIndex    分页索引
 *
 *  @return 对应页面的视图
 */
- (UIView *)corePageView:(GJCorePageView *)corePageView viewInControllerForPageIndex:(NSInteger)pageIndex;

@end

@interface GJCorePageView : UIView

- (UIView *)pageViewForIndex:(NSInteger)index;

@property (nonatomic, weak) id <GJCorePageViewDataSource> dataSource;
@property (nonatomic, weak) id <GJCorePageViewDelegate> delegate;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign, getter = isTopBarMarqueeEnabled) BOOL topBarMarqueeEnabled;
@property (nonatomic, retain) UIScrollView * pageScrollView; //分页视图容器

/**
 *  重新加载数据
 */
- (void)reloadData;

@end