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
@end
