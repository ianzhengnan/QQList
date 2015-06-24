//
//  GroupModel.m
//  QQList
//
//  Created by zhengna on 15/6/23.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "GroupModel.h"
#import "FriendsModel.h"

@implementation GroupModel

- (instancetype)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            FriendsModel *model = [FriendsModel friendWithDict:dict];
            [muArray addObject:model];
        }
        self.friends = muArray;
    }
    return self;
}

+ (instancetype)groupwithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
}

@end
