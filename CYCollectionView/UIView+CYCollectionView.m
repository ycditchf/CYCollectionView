//
//  UIView+CYAddition.m
//  CYTagView
//
//  Created by SimonChen on 17/3/29.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import "UIView+CYCollectionView.h"
#import <objc/runtime.h>

@implementation UIView (CYCollectionView)
-(void)setCollectionViewSectionIndex:(NSInteger)collectionViewSectionIndex
{
    objc_setAssociatedObject(self, @selector(collectionViewSectionIndex), @(collectionViewSectionIndex), OBJC_ASSOCIATION_RETAIN);
}

- (NSInteger)collectionViewSectionIndex
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(collectionViewSectionIndex));
    if (number) {
        return [number integerValue];
    }
    return NSNotFound;
}

- (void)setCollectionView_tapGesture:(UITapGestureRecognizer *)collectionView_tapGesture
{
    objc_setAssociatedObject(self, @selector(collectionView_tapGesture), collectionView_tapGesture, OBJC_ASSOCIATION_RETAIN);
}

- (UITapGestureRecognizer *)collectionView_tapGesture
{
    return objc_getAssociatedObject(self, @selector(collectionView_tapGesture));
}

- (void)setCollectionView_panGesture:(UIPanGestureRecognizer *)collectionView_panGesture
{
    objc_setAssociatedObject(self, @selector(setCollectionView_panGesture:), collectionView_panGesture, OBJC_ASSOCIATION_RETAIN);
}

- (UIPanGestureRecognizer *)collectionView_panGesture
{
    return objc_getAssociatedObject(self, @selector(collectionView_panGesture));
}
@end
