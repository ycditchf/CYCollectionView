//
//  CYTagCellHeader.h
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYTagCellHeader : UIView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (nonatomic, copy) void(^editBntBlock)(CYTagCellHeader *view);
@property (nonatomic, assign) BOOL isEdit; //Default is NO;
- (IBAction)onEditBtn:(id)sender;
@end
