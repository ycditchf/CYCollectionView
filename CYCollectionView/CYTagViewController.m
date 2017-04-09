//
//  TagViewController.m
//  CYTagView
//
//  Created by SimonChen on 17/3/27.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import "CYTagViewController.h"
#import "CYCollectionView.h"
#import "CYTagCell.h"
#import "CYTagCellHeader.h"

#define  kSpaceOfItems 18

@interface CYTagViewController () <CYCollectionViewDelegate>
@property (nonatomic, strong) CYCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *myTags;
@property (nonatomic, strong) NSMutableArray *recommendTags;

@property (nonatomic, assign) BOOL isEdit;
@end

@implementation CYTagViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"标签Demo";

    self.myTags = @[@"头条", @"视频", @"娱乐", @"体育", @"本地", @"网易号", @"财经", @"科技"].mutableCopy;

    self.recommendTags = @[@"汽车", @"社会", @"军事", @"时尚", @"直播", @"图片", @"跟帖", @"NBA", @"热点", @"房产", @"股票", @"轻松一刻", @"态度公开课",@"国际足球", @"CBA", @"读书" ].mutableCopy;

    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -

- (NSInteger)numberOfSectionInCollectionView:(CYCollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(CYCollectionView *)collectionView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.myTags.count;
    }else{
        return self.recommendTags.count;
    }
}

- (CGSize)collectionView:(CYCollectionView *)collectionView sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tagType == 0) {
        return CGSizeMake((self.view.bounds.size.width - 20-3*kSpaceOfItems)/4, 38);
    }

    NSString *text = nil;
    if (indexPath.section == 0) {
        text = self.myTags[indexPath.row];
    }else{
        text = self.recommendTags[indexPath.row];
    }

    CGFloat width = [self sizeOfString:text withFont:[UIFont systemFontOfSize:14]].width;
    width += 28;//margin
    return CGSizeMake(width, 38);
}

- (CYCollectionCell *)collectionView:(CYCollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell
    CYTagCell *cell = (CYTagCell *)[collectionView dequeueReusableCellWithIdentifier:@"CYTagCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"CYTagCell" owner:nil options:nil].lastObject;
        cell.reuseIdentifier = @"CYTagCell";
    }

    if (indexPath.section == 0) {
        cell.textLabel.text = self.myTags[indexPath.row];
        if (indexPath.row == 0) {
            cell.isEdit = NO;
        }else{
            cell.isEdit = self.isEdit;
        }
    }else{
        cell.textLabel.text = self.recommendTags[indexPath.row];
    }

    __weak typeof(self) weakSelf = self;
    cell.onDeleteBtnBlock = ^(CYTagCell *cell){
        [weakSelf deleteTagAtIndexPath:cell.indexPath];
    };
    return cell;

}

- (void)deleteTagAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSString *text = self.myTags[indexPath.row];
        [self.myTags removeObjectAtIndex:indexPath.row];
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];

        [self.recommendTags addObject:text];
        NSIndexPath *toIndexPath = [NSIndexPath indexPathForRow:self.recommendTags.count-1 inSection:1];
        [self.collectionView insertItemsAtIndexPaths:@[toIndexPath]];
    }
}

- (UIView *)collectionView:(CYCollectionView *)collectionView headerViewForSection:(NSInteger)section
{
    CYTagCellHeader *headerView = [[NSBundle mainBundle] loadNibNamed:@"CYTagCellHeader" owner:nil options:nil].lastObject;
    if (section == 0) {

        headerView.titleLabel.text = @"切换栏目";
        headerView.isEdit = self.isEdit;
        __weak typeof(self) weakSelf = self;
        headerView.editBntBlock = ^(CYTagCellHeader *view){
            if (view.isEdit != weakSelf.isEdit) {
                weakSelf.isEdit = view.isEdit;
                [weakSelf.collectionView reloadData];
            }
        };
    }else{
        headerView.titleLabel.text = @"点击添加更多栏目";
        headerView.subTitleLabel.hidden = YES;
        headerView.editBtn.hidden = YES;
    }
    return headerView;
}

- (CGFloat)collectionView:(CYCollectionView *)collectionView interitemSpacingForSectionAtIndex:(NSInteger)section
{
    return kSpaceOfItems;
}
- (CGFloat)collectionView:(CYCollectionView *)collectionView lineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UIEdgeInsets)collectionView:(CYCollectionView *)collectionView insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 10, 15, 10);
}

- (void)collectionView:(CYCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath:%@",indexPath);
    if (indexPath.section == 1) {
        NSString *text = self.recommendTags[indexPath.row];
        [self.recommendTags removeObjectAtIndex:indexPath.row];
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];

        [self.myTags addObject:text];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.myTags.count-1 inSection:0];
        [self.collectionView insertItemsAtIndexPaths:@[indexPath]];

    }else{
        if (indexPath.row == 0) {
            return;
        }

        if (self.isEdit) {
            [self deleteTagAtIndexPath:indexPath];
        }
    }
}

- (void)collectionView:(CYCollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *text = nil;
    if (fromIndexPath.section == 0) {
        text = self.myTags[fromIndexPath.row];
        [self.myTags removeObjectAtIndex:fromIndexPath.row];
        [self.myTags insertObject:text atIndex:toIndexPath.row];
    }else{

    }
}

- (BOOL)collectionViewShouldReorder:(CYCollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return NO;
        }else{
            return YES;
        }
    }else{
        return NO;
    }
}

- (NSInteger)collectionViewBeginDragIndex:(CYCollectionView *)collectionView atSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return -1;
}

- (CYCollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[CYCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _collectionView.gridDelegate = self;
    }
    return _collectionView;
}

#pragma mark - Util
- (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font
{
    if (!font || !string) {
        return CGSizeZero;
    }
    CGSize maxSize = CGSizeMake(NSIntegerMax, NSIntegerMax);
    NSMutableParagraphStyle *paragraphStyle= [[NSMutableParagraphStyle alloc] init];
    CGSize realSize = [string boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    realSize.width += 1;
    return realSize;
}
@end
