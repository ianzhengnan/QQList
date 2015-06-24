//
//  GroupModel.h
//  QQList
//
//  Created by zhengna on 15/6/23.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FriendsModel;
@interface GroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) FriendsModel *friendModel;
@property (nonatomic, assign) BOOL isOpen;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupwithDict:(NSDictionary *)dict;

@end
