//
//  UIView+CYAddition.h
//  CYTagView
//
//  Created by SimonChen on 17/3/29.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CYCollectionView)
@property (nonatomic, assign) NSInteger collectionViewSectionIndex;
@property (nonatomic, strong) UITapGestureRecognizer *collectionView_tapGesture;
@property (nonatomic, strong) UIPanGestureRecognizer *collectionView_panGesture;
@end
