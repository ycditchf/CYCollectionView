//
//  CYTagCell.m
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import "CYTagCell.h"

@implementation CYTagCell

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.isSelected = NO;
    self.isEdit = NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//-(NSString *)description
//{
//    return [NSString stringWithFormat:@"%@ frame:%@ section:%zd row:%zd",self, NSStringFromCGRect(self.frame), self.indexPath.section, self.indexPath.row];
//}

-(void)setIsEdit:(BOOL)isEdit
{
    _isEdit = isEdit;
    self.deleteBtn.hidden = !_isEdit;
}

-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (_isSelected) {
        self.bgImgView.image = [UIImage imageNamed:@"tagveiw_tag_bg_h"];

    }else{
        self.bgImgView.image = [UIImage imageNamed:@"tagveiw_tag_bg"];
    }

}

- (IBAction)onDeleteBtn:(id)sender
{
    if (self.onDeleteBtnBlock) {
        self.onDeleteBtnBlock(self);
    }
}
@end
