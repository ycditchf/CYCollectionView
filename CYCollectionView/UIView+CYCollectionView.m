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
-(void)setGridViewSectionIndex:(NSInteger)gridViewSectionIndex
{
    objc_setAssociatedObject(self, @selector(gridViewSectionIndex), @(gridViewSectionIndex), OBJC_ASSOCIATION_RETAIN);
}

- (NSInteger)gridViewSectionIndex
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(gridViewSectionIndex));
    if (number) {
        return [number integerValue];
    }
    return NSNotFound;
}
@end
