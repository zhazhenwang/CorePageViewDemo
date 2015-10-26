//
//  GJCorePageView.m
//  GJB4iPhone
//
//  Created by macbook on 15/9/17.
//  Copyright (c) 2015年 zhenwang. All rights reserved.
//

#import "GJCorePageView.h"
#import "GJCorePageTopBar.h"

#define SUB_PAGEVIEW_TAG 1000

@interface GJCorePageView () <UIScrollViewDelegate>

@property (nonatomic, assign) BOOL isFromDragging;           //是否用户滑动切换
@property (nonatomic, assign) NSInteger pageCount;           //总页数
@property (nonatomic, assign) NSInteger curPage;             //当前页
@property (nonatomic, retain) GJCorePageTopBar * topBar;     //顶部导航按钮
@property (nonatomic, retain) NSMutableDictionary * pageViewDict;

@end

@implementation GJCorePageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (NSInteger)selectedIndex
{
    return self.curPage;
}

- (void)reloadData
{
    if (_topBar && _pageScrollView)
    {
        self.curPage = 0;
        self.pageCount = 0;
        [_topBar removeFromSuperview]; _topBar = nil;
        [_pageScrollView removeFromSuperview]; _pageScrollView = nil;
    }

    //页数
    self.pageCount = [self.dataSource numberOfPagesInCorePageView:self];
    
    //标题列表
    NSArray * titlesArr = [self.dataSource titlesInTopBarOfCorePageView:self];
    
    if (titlesArr && titlesArr.count != self.pageCount) return;
    
    //顶部导航按钮
    __weak typeof(self) weakSelf = self;
    _topBar = [[GJCorePageTopBar alloc] initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 self.width,
                                                                 GJCorePageBarHeight)];
    _topBar.isMarqueeable = self.isTopBarMarqueeEnabled;
    _topBar.titleArray = titlesArr;
    _topBar.switchBlock = ^(NSInteger fromIndex, NSInteger toIndex)
    {
        [weakSelf transitionPageViewTo:toIndex];
    };
    
    //分页视图容器
    _pageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                     CGRectGetMaxY(_topBar.frame),
                                                                     self.width,
                                                                     self.height - GJCorePageBarHeight)];
    _pageScrollView.delegate = self;
    _pageScrollView.pagingEnabled = YES;
    _pageScrollView.showsHorizontalScrollIndicator = NO;
    _pageScrollView.showsVerticalScrollIndicator   = NO;
    _pageScrollView.contentSize = CGSizeMake(_pageScrollView.width * self.pageCount, _pageScrollView.height);
    
    [self addSubview:_topBar];
    [self addSubview:_pageScrollView];
    
    [self handlePageViewOfPage:0];
}

/**
 *  切换视图
 *
 *  @param toPage 目标页
 */
- (void)transitionPageViewTo:(NSInteger)toPage
{
    if (self.curPage == toPage) return;
    
    ((UIButton *)[self.topBar viewWithTag:(self.curPage + TOP_BUTTON_FLAG)]).selected = NO;
    
    self.topBar.selectedBtn = (UIButton *)[self.topBar viewWithTag:(toPage + TOP_BUTTON_FLAG)];
    
    self.topBar.selectedBtn.selected = YES;
    
    self.curPage = toPage;
    
    [self handlePageViewOfPage:toPage];

    __weak typeof(self) weakSelf = self;
    
    //导航按钮切换
    if (_isFromDragging)
    {
        UIButton * targetBtn = (UIButton *)[_topBar viewWithTag:toPage + TOP_BUTTON_FLAG];
        CGFloat visibleMargin = _topBar.isMarqueeable ? GJCorePageBarLeftRightMargin : 0;
        CGFloat deltaWidth = CGRectGetMaxX(targetBtn.frame) + visibleMargin - _topBar.width;
        if (deltaWidth > 0)
        {
            [_topBar setContentOffset:CGPointMake(deltaWidth, 0) animated:YES];
        }
        CGFloat offsetX = _topBar.contentOffset.x;
        CGFloat visibleX = targetBtn.x - visibleMargin;
        if (offsetX > visibleX)
        {
            [_topBar setContentOffset:CGPointMake(visibleX, 0) animated:YES];
        }
    }

    [_topBar doTopBarButtonSwitchAnmation:toPage completionBlock:^{
        if (!weakSelf.isFromDragging)
        {
            [weakSelf.pageScrollView setContentOffset:CGPointMake(toPage * weakSelf.pageScrollView.width, 0)];
        }
        [weakSelf doSwitchFinishedActionTo:toPage];
    }];
}

- (void)handlePageViewOfPage:(NSInteger)page
{
    UIView * subPageView = [self.dataSource corePageView:self viewInControllerForPageIndex:page];
    
    if ([_pageScrollView.subviews containsObject:subPageView]) return;
    
    CGFloat pageW = _pageScrollView.width;
    CGFloat pageH = _pageScrollView.height;
    CGFloat pageX = page * pageW;
    CGFloat pageY = 0;
    subPageView.frame = CGRectMake(pageX, pageY, pageW, pageH);
    subPageView.tag = SUB_PAGEVIEW_TAG + page;
    [_pageScrollView addSubview:subPageView];
    [self.pageViewDict setObject:subPageView forKey:@(page)];
}

- (NSMutableDictionary *)pageViewDict
{
    if (_pageViewDict == nil)
    {
        _pageViewDict = [NSMutableDictionary dictionary];
    }
    return _pageViewDict;
}

- (void)doSwitchFinishedActionTo:(NSInteger)toPage
{
    if ([self.delegate respondsToSelector:@selector(corePageView:didSwitchPageIndexTo:)])
    {
        [self.delegate corePageView:self didSwitchPageIndexTo:toPage];
    }
}

- (UIView *)pageViewForIndex:(NSInteger)index
{
    return [self.pageViewDict objectForKey:@(index)];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate)
    {
        _isFromDragging = YES;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_isFromDragging)
    {
        NSInteger page = scrollView.contentOffset.x / scrollView.width;
        
        [self transitionPageViewTo:page];
    }
    _isFromDragging = NO;
}

@end
