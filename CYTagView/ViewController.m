//
//  ViewController.m
//  CYTagView
//
//  Created by SimonChen on 17/3/27.
//  Copyright © 2017年 rainbow. All rights reserved.
//

#import "ViewController.h"
#import "CYTagViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.title = @"CYGridView";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    CYTagViewController *tagVC = [CYTagViewController new];
    tagVC.tagType = indexPath.row;
    [self.navigationController pushViewController:tagVC animated:YES];

//    if (indexPath.row == 0) {
//    }else if (indexPath.row == 1){
//    }
}
@end
