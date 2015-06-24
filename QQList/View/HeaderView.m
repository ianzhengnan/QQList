//
//  HeaderView.m
//  QQList
//
//  Created by zhengna on 15/6/23.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "HeaderView.h"
#import "GroupModel.h"

@implementation HeaderView{

    UIButton *_arrowBtn;
    UILabel *_label;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (instancetype)headerView:(UITableView *)tableView{
    static NSString *identifier = @"header";
    HeaderView *header = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!header){
        header = [[HeaderView alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super init]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        button.imageView.clipsToBounds = NO;
        
        _arrowBtn = button;
        [self addSubview:_arrowBtn];
        
        //create label, display current people number
        UILabel *labelRight = [[UILabel alloc] init];
        labelRight.textAlignment = NSTextAlignmentCenter;
        _label = labelRight;
        [self addSubview:_label];
    }
    return self;
}


#pragma mark - buttonAction
- (void)buttonAction{
    
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if ([self.delegate respondsToSelector:@selector(clickView)]) {
        [self.delegate clickView];
    }
}

- (void)didMoveToSuperview{

    _arrowBtn.imageView.transform = self.groupModel.isOpen ?
        CGAffineTransformMakeRotation(M_PI_2) :
        CGAffineTransformMakeRotation(0);
}

//layout:set the frame value of button and frame
- (void)layoutSubviews{

    [super layoutSubviews];
    _arrowBtn.frame = self.bounds;
    _label.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}

//assign value
- (void)setGroupModel:(GroupModel *)groupModel{
    
    _groupModel = groupModel;
    [_arrowBtn setTitle:_groupModel.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%@/%lu", _groupModel.online, (unsigned long)_groupModel.friends.count];
    
    
}


@end
