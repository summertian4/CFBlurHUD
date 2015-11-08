//
//  CFTableController.m
//  CFBlurHUD
//
//  Created by 周凌宇 on 15/11/8.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import "CFTableController.h"
#import "CFBlurHUD.h"

@interface CFTableController ()

@end

@implementation CFTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [CFBlurHUD show:@""];
            break;
        }
        case 1:
        {
            [CFBlurHUD show:@"提示信息如果较长会自动调节HUD高度"];
            break;
        }
        case 2:
        {
            [CFBlurHUD showSuccess:@""];
            break;
        }
        case 3:
        {
            [CFBlurHUD showSuccess:@"不希望有提示信息可以填写@\"\"或者nil"];
            break;
        }
        case 4:
        {
            [CFBlurHUD showFaild:@""];
            break;
        }
        case 5:
        {
            [CFBlurHUD showFaild:@"提示信息"];
            break;
        }
        case 6:
        {
            [CFBlurHUD dismiss];
            break;
        }
        default:
            break;
    }
}

@end
