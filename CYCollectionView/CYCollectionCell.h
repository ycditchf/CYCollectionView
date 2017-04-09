//
//  CYCollectionCell.h
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol CYCollectionCellDelegate <NSObject>
//@property (nonatomic, strong) NSIndexPath *indexPath;
//@end
//
@interface CYCollectionCell : UIView
//<CYCollectionCellDelegate>
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSString *reuseIdentifier;
@end
