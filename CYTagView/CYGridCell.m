//
//  CYGridCell.m
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import "CYGridCell.h"

@implementation CYGridCell
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
//    UITapGestureRecognizer *tap
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
