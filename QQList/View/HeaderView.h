//
//  HeaderView.h
//  QQList
//
//  Created by zhengna on 15/6/23.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupModel.h"

// for the click
@protocol HeaderViewDelegate <NSObject>

@optional
- (void)clickView;

@end

@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, assign) id<HeaderViewDelegate> delegate;
@property (nonatomic, strong) GroupModel *groupModel;

+ (instancetype)headerView:(UITableView *)tableView;

@end
