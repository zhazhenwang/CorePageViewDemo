//
//  GJCorePageTopBar.h
//  GJB4iPhone
//
//  Created by macbook on 15/9/17.
//  Copyright (c) 2015年 zhenwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GJCorePageConst.h"

#define TOP_BUTTON_FLAG 100

typedef void (^GJTopBarSwitchIndexBlock)(NSInteger fromIndex, NSInteger toIndex);

@interface GJCorePageTopBar : UIScrollView

/**
 *  顶部按钮点击block
 */
@property (nonatomic, copy) GJTopBarSwitchIndexBlock switchBlock;

/**
 *  顶部标题列表
 */
@property (nonatomic, retain) NSArray * titleArray;

/**
 *  顶部是否滚动
 */
@property (nonatomic, assign) BOOL isMarqueeable;

/**
 *  底部滚动视图
 */
@property (nonatomic, retain) UIView * bottomIndicator;

/**
 *  当前选中按钮
 */
@property (nonatomic, assign) UIButton * selectedBtn;

/**
 *  切换按钮动画
 *
 *  @param toIndex 按钮索引
 */
- (void)doTopBarAnimation:(NSInteger)toIndex;

/**
 *  切换按钮动画/回调
 *
 *  @param toIndex 按钮索引
 *  @param completionBlock 动画回调
 */
- (void)doTopBarButtonSwitchAnmation:(NSInteger)toIndex completionBlock:(void (^)(void))completionBlock;

@end
