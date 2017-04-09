//
//  CYCollectionView.h
//  CYTagView
//
//  Created by SimonChen on 17/3/28.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CYCollectionCell;
@class CYCollectionView;

@protocol CYCollectionViewDelegate <NSObject>

- (NSInteger)numberOfSectionInGridView:(CYCollectionView *)gridView;
- (NSInteger)gridView:(CYCollectionView *)gridView numberOfRowsInSection:(NSInteger)section;
- (CGSize)gridView:(CYCollectionView *)gridView sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CYCollectionCell *)gridView:(CYCollectionView *)gridView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

//拖拽时必须实现
- (void)gridView:(CYCollectionView *)gridView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;

@optional
- (UIView *)gridView:(CYCollectionView *)gridView headerViewForSection:(NSInteger)section;
- (UIView *)gridView:(CYCollectionView *)gridView footerViewForSection:(NSInteger)section;

- (CGFloat)gridView:(CYCollectionView *)gridView interitemSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)gridView:(CYCollectionView *)gridView lineSpacingForSectionAtIndex:(NSInteger)section;

- (UIEdgeInsets)gridView:(CYCollectionView *)gridView insetForSectionAtIndex:(NSInteger)section;

- (void)gridView:(CYCollectionView *)gridView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

//支持拖拽排序
- (BOOL)gridViewShouldReorder:(CYCollectionView *)gridView atIndexPath:(NSIndexPath *)indexPath;
//isEdit为YES时，对应section 前几个不让拖拽，不指定的返回-1
- (NSInteger)gridViewBeginDragIndex:(CYCollectionView *)gridView atSection:(NSInteger)section;

@end



/**
 <#Description#>
 */
@interface CYCollectionView : UIScrollView
@property (nonatomic, weak) id <CYCollectionViewDelegate> gridDelegate;


- (void)reloadData;

- (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
- (void)deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
//- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;


- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;


@end
