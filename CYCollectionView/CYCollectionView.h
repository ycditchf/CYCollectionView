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

- (NSInteger)numberOfSectionInCollectionView:(CYCollectionView *)collectionView;
- (NSInteger)collectionView:(CYCollectionView *)collectionView numberOfRowsInSection:(NSInteger)section;
- (CGSize)collectionView:(CYCollectionView *)collectionView sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CYCollectionCell *)collectionView:(CYCollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

//拖拽时必须实现
- (void)collectionView:(CYCollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;

@optional
- (UIView *)collectionView:(CYCollectionView *)collectionView headerViewForSection:(NSInteger)section;
- (UIView *)collectionView:(CYCollectionView *)collectionView footerViewForSection:(NSInteger)section;

- (CGFloat)collectionView:(CYCollectionView *)collectionView interitemSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(CYCollectionView *)collectionView lineSpacingForSectionAtIndex:(NSInteger)section;

- (UIEdgeInsets)collectionView:(CYCollectionView *)collectionView insetForSectionAtIndex:(NSInteger)section;

- (void)collectionView:(CYCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

//支持拖拽排序
- (BOOL)collectionViewShouldReorder:(CYCollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath;
//isEdit为YES时，对应section 前几个不让拖拽，不指定的返回-1
- (NSInteger)collectionViewBeginDragIndex:(CYCollectionView *)collectionView atSection:(NSInteger)section;

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


- (CYCollectionCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;
@end
