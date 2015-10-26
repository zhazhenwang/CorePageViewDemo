//
//  ViewController.m
//  CorePageViewDemo
//
//  Created by Zhenwang Zha on 15/10/26.
//  Copyright © 2015年 zhenwang. All rights reserved.
//

#import "ViewController.h"
#import "GJCorePageView.h"

@interface ViewController () <GJCorePageViewDataSource, GJCorePageViewDelegate>
{
    GJCorePageView * _pageView;
    NSArray        * _titleArr;
    NSMutableArray * _viewArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _pageView = [[GJCorePageView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
    _pageView.dataSource = self;
    _pageView.delegate = self;
    
    /**
     *  需要顶部滚动, 把下面属性设置为Yes
     */
//    _pageView.topBarMarqueeEnabled = YES;
    
    _titleArr = @[@"视图1", @"视图2", @"视图3", @"视图4"];
    
    _viewArr = [NSMutableArray array];
    
    //以下数据源可以定制为TableView
    UITableView * subView1 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    subView1.backgroundColor = [UIColor greenColor];
    [_viewArr addObject:subView1];
    
    UITableView * subView2 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    subView2.backgroundColor = [UIColor yellowColor];
    [_viewArr addObject:subView2];
    
    UITableView * subView3 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    subView3.backgroundColor = [UIColor redColor];
    [_viewArr addObject:subView3];
    
    UITableView * subView4 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    subView4.backgroundColor = [UIColor brownColor];
    [_viewArr addObject:subView4];
    
    [self.view addSubview:_pageView];
    
    [_pageView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)corePageView:(GJCorePageView *)corePageView viewInControllerForPageIndex:(NSInteger)pageIndex
{
    return _viewArr[pageIndex];
}

- (NSArray *)titlesInTopBarOfCorePageView:(GJCorePageView *)corePageView
{
    return _titleArr;
}

- (NSInteger)numberOfPagesInCorePageView:(GJCorePageView *)corePageView
{
    return _viewArr.count;
}

#pragma mark - GJCorePageViewDelegate

- (void)corePageView:(GJCorePageView *)corePageView didSwitchPageIndexFrom:(NSInteger)fromIndex to:(NSInteger)toIndex
{
    NSLog(@"页面%ld -> 页面%ld", fromIndex + 1, toIndex + 1);
}

@end
