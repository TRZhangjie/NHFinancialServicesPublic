// Inkwell
// BaseTableViewGroup.m
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//
// @ description <#描述#>

#import "BaseTableViewGroup.h"

#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "UIColor+ColorMethodExtension.h"
#import "InkwellFrameMarco.h"
#import "InkwellFontMarco.h"

@interface BaseTableViewGroup ()<UIScrollViewDelegate>

@end

@implementation BaseTableViewGroup

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableViewUI];
}

#pragma mark - setUpUI
- (void)setUpTableViewUI{
    
    self.tableView.backgroundColor = [UIColor jh_colorWithHexString:@"#1a1b20"];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 44.0f;//推测高度，必须有，可以随便写多少
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.rowHeight =UITableViewAutomaticDimension;
    //分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * str = @"testCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0000001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0000001f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

#pragma mark - 下拉刷新
- (void)dropDownToRefreshData:(void(^)(void))RefreshingBlock {
   
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if(RefreshingBlock){
            //这里做请求数据操作
            RefreshingBlock();
        }
    }];
    
    // 设置自动切换透明度
    header.automaticallyChangeAlpha = YES;
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    if (self.refreshingColor == 1)
    {
        header.stateLabel.textColor = [UIColor whiteColor];
        header.lastUpdatedTimeLabel.textColor = [UIColor whiteColor];
        header.arrowView.image = [UIImage imageNamed:@"arrow_white"];
        header.activityIndicatorViewStyle =  UIActivityIndicatorViewStyleWhite;
    }
    // 设置header
    self.tableView.mj_header = header;
    // 隐藏上拉加载
    self.tableView.mj_footer.hidden = YES;
}

#pragma mark - 上拉加载更多
- (void)pullUpToLoadData:(void(^)(void))RefreshingBlock {
    MJRefreshBackNormalFooter * footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if(RefreshingBlock){
            //这里做请求数据操作
            RefreshingBlock();
        }
    }];
    self.tableView.mj_footer = footer;
     self.tableView.mj_footer.hidden = YES;
}

#pragma mark -- set get
- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (void)setHasMoreData:(BOOL)hasMoreData{
    _hasMoreData = hasMoreData;
    if(self.tableView.mj_footer){
        if(hasMoreData){
            [self.tableView.mj_footer endRefreshing];
        }else{
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }
}
- (UIView *)noDataView {
    if (!_noDataView) {
        /// ! 容器
        _noDataView = [[UIView alloc] init];
        _noDataView.backgroundColor = [UIColor whiteColor];
        [self.tableView addSubview:_noDataView];
        [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view).offset(1.0f);
            make.bottom.equalTo(self.view);
        }];
        
        /// ! 图片
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.image = [UIImage imageNamed:@"data_none"];
        [_noDataView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(Adapted(157.5f), Adapted(128.0f)));
            make.center.equalTo(self->_noDataView);
        }];
        
        /// ! 提示
        UILabel *msgLabel = [[UILabel alloc] init];
        msgLabel.text = @"暂无更多数据";
        msgLabel.font = H18;
        msgLabel.textColor = [UIColor jh_decimalColorWithRed:128 green:128 blue:128];
        msgLabel.textAlignment = 1;
        [_noDataView addSubview:msgLabel];
        [msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self->_noDataView);
            make.top.equalTo(imgView.mas_bottom).offset(Adapted(10.0f));
        }];
    }
    return _noDataView;
}



@end
