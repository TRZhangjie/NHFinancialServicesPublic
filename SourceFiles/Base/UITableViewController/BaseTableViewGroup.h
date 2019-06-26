// Inkwell
// BaseTableViewGroup.h
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//
// @ description BaseTableViewGroup

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RefreshingColor) {
    RefreshingColorNomal = 0,
    RefreshingColorWhite = 1,
};

@interface BaseTableViewGroup : UIViewController
<
    UITableViewDataSource,
    UITableViewDelegate
>{
    NSUInteger _refreshPage;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray; //cell相关data
@property (nonatomic, strong) UIView *noDataView;
@property (nonatomic, assign) BOOL hasMoreData;//改变上拉加载更多数据状态
@property (nonatomic, assign) RefreshingColor refreshingColor;

// 下拉刷新
- (void)dropDownToRefreshData:(void(^)(void))RefreshingBlock;

// 上拉加载更多
- (void)pullUpToLoadData:(void(^)(void))RefreshingBlock;
 
@end
