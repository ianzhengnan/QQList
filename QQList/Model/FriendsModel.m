//
//  FriendsModel.m
//  QQList
//
//  Created by zhengna on 15/6/23.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel

- (instancetype)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
}

@end
