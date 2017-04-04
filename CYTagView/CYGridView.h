//
//  CYGridView.h
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CYGridCell;
@class CYGridView;

@protocol CYGridViewDelegate <NSObject>

- (NSInteger)numberOfSectionInGridView:(CYGridView *)gridView;
- (NSInteger)gridView:(CYGridView *)gridView numberOfRowsInSection:(NSInteger)section;
- (CGSize)gridView:(CYGridView *)gridView sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CYGridCell *)gridView:(CYGridView *)gridView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

//拖拽时必须实现
- (void)gridView:(CYGridView *)gridView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;

@optional
- (UIView *)gridView:(CYGridView *)gridView headerViewForSection:(NSInteger)section;
- (UIView *)gridView:(CYGridView *)gridView footerViewForSection:(NSInteger)section;

- (CGFloat)gridView:(CYGridView *)gridView interitemSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)gridView:(CYGridView *)gridView lineSpacingForSectionAtIndex:(NSInteger)section;

- (UIEdgeInsets)gridView:(CYGridView *)gridView insetForSectionAtIndex:(NSInteger)section;

- (void)gridView:(CYGridView *)gridView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

//支持拖拽排序
- (BOOL)gridViewShouldReorder:(CYGridView *)gridView atIndexPath:(NSIndexPath *)indexPath;
//isEdit为YES时，对应section 前几个不让拖拽，不指定的返回-1
- (NSInteger)gridViewBeginDragIndex:(CYGridView *)gridView atSection:(NSInteger)section;

@end



/**
 <#Description#>
 */
@interface CYGridView : UIScrollView
@property (nonatomic, weak) id <CYGridViewDelegate> gridDelegate;


- (void)reloadData;

- (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
- (void)deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
//- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;


- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;


@end
