//
//  CYGridCell.h
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol CYGridCellDelegate <NSObject>
//@property (nonatomic, strong) NSIndexPath *indexPath;
//@end
//
@interface CYGridCell : UIView
//<CYGridCellDelegate>
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
