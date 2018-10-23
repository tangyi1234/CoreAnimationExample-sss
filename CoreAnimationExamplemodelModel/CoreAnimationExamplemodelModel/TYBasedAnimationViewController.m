//
//  TYBasedAnimationViewController.m
//  CoreAnimationExamplemodelModel
//
//  Created by 汤义 on 2018/10/23.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYBasedAnimationViewController.h"

@interface TYBasedAnimationViewController ()

@end

@implementation TYBasedAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addButView];
}

- (void)addButView{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, H, 200, 30);
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

@end
