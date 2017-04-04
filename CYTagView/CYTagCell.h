//
//  CYTagCell.h
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import "CYGridCell.h"

@interface CYTagCell : CYGridCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (nonatomic, assign) BOOL isEdit;
@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, copy)  void(^onDeleteBtnBlock)(CYTagCell *cell);

- (IBAction)onDeleteBtn:(id)sender;

@end
