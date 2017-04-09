//
//  CYTagCellHeader.m
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import "CYTagCellHeader.h"

@implementation CYTagCellHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)onEditBtn:(id)sender {
    self.isEdit = !self.isEdit;
    if (self.editBntBlock) {
        self.editBntBlock(self);
    }
}

-(void)setIsEdit:(BOOL)isEdit
{
    _isEdit = isEdit;
    if (self.isEdit) {
        [self.editBtn setTitle:@"完成" forState:UIControlStateNormal];
    }else{
        [self.editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    }
}
@end
