//
//  GJCorePageTopBar.m
//  GJB4iPhone
//
//  Created by macbook on 15/9/17.
//  Copyright (c) 2015年 zhenwang. All rights reserved.
//

#import "GJCorePageTopBar.h"

@implementation GJCorePageTopBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = GJCorePageTopBarColor;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    CGFloat latestX = GJCorePageBarLeftRightMargin;
    if (titleArray)
    {
        NSInteger titleCount = titleArray.count;
        for (int i = 0; i < titleCount; i++)
        {
            // 如果 marquee -- 先计算button的width
            // 否则 -- 每个button平均分配
            
            NSString * title = titleArray[i];
            
            CGFloat titleW = self.width / titleCount;
            CGFloat titleH = self.height;
            CGFloat titleX = i * titleW;
            CGFloat titleY = 0;
            
            if (_isMarqueeable)
            {
                titleW = [title boundingRectWithSize:CGSizeMake(10000, 10000)
                                          attributes:nil
                                                font:GJCorePageTopBarTextFont
                                       lineBreakMode:NSLineBreakByWordWrapping].width;
                titleW += (2 * GJCorePageBarButtonInset);
                titleX = latestX;
            }
            
            UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom
                                                     title:title
                                                 titleFont:GJCorePageTopBarTextFont
                                                     frame:CGRectMake(titleX, titleY, titleW, titleH)
                                                     image:nil
                                           backgroundColor:[UIColor clearColor]
                                                    target:self
                                                    action:@selector(swtichAction:)
                                                       tag:i + TOP_BUTTON_FLAG];
            
            [titleBtn setTitleColor:GJCorePageTopBarNormalTextColor   forState:UIControlStateNormal];
            [titleBtn setTitleColor:GJCorePageTopBarSelectedTextColor forState:UIControlStateSelected];
            
            if (i == 0)
            {
                [titleBtn setSelected:YES];
                _selectedBtn = titleBtn;
                
                CGFloat bottomW  = titleBtn.width;
                CGFloat bottomH  = GJCorePageBarBottomHeight;
                CGFloat bottomX  = titleBtn.x;
                CGFloat bottomY  = self.height - bottomH;
                
                _bottomIndicator = [[UIView alloc] initWithFrame:CGRectMake(bottomX, bottomY, bottomW, bottomH)];
                _bottomIndicator.backgroundColor = GJCorePageTopBarBottomColor;
                [self addSubview:_bottomIndicator];
            }
            
            [self addSubview:titleBtn];
            
            if (i == titleCount - 1)
            {
                [self setContentSize:CGSizeMake(CGRectGetMaxX(titleBtn.frame) + (_isMarqueeable ? GJCorePageBarLeftRightMargin : 0), self.height)];
            }
            latestX = CGRectGetMaxX(titleBtn.frame) + GJCorePageBarButtonMargin;
        }
    }
}

- (void)swtichAction:(UIButton *)btn
{
    if ([btn isEqual:_selectedBtn]) return;
    
    _selectedBtn.selected = NO;
    
    btn.selected = YES;
    
    NSInteger fromIndex = _selectedBtn.tag - TOP_BUTTON_FLAG;
    NSInteger toIndex = btn.tag - TOP_BUTTON_FLAG;
    if (self.switchBlock)
    {
        self.switchBlock(fromIndex, toIndex);
    }
}

- (void)doTopBarButtonSwitchAnmation:(NSInteger)toIndex completionBlock:(void (^)(void))completionBlock
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25f
                     animations:^{[weakSelf doTopBarAnimation:toIndex];}
                      completion:^(BOOL finished) {
                          if (finished) {
                              if (completionBlock) {
                                  completionBlock();
                              }
                          }
                      }];
}

- (void)doTopBarAnimation:(NSInteger)toIndex
{
    UIButton * targetBtn = (UIButton *)[self viewWithTag:toIndex + TOP_BUTTON_FLAG];
    if (_isMarqueeable)
    {
        [self.bottomIndicator setFrame:CGRectMake(targetBtn.x,
                                                  self.bottomIndicator.y,
                                                  targetBtn.width,
                                                  self.bottomIndicator.height)];
        return;
    }
    [self.bottomIndicator setX:targetBtn.x];
}

@end
