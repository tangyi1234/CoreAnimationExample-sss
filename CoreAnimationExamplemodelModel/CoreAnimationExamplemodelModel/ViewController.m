//
//  ViewController.m
//  CoreAnimationExamplemodelModel
//
//  Created by 汤义 on 2018/10/22.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "ViewController.h"
#import "TYBasedAnimationViewController.h"
#import "TYKeyFramesViewController.h"
#import "TYGroupAnimationViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addButView];
}

- (void)addButView{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 64, 150, 30);
    but.backgroundColor = [UIColor greenColor];
    [but setTitle:@"基础动画" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(10, 100, 150, 30);
    but1.backgroundColor = [UIColor greenColor];
    [but1 setTitle:@"关键帧动画" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(10, 135, 150, 30);
    but2.backgroundColor = [UIColor greenColor];
    [but2 setTitle:@"组动画" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(selectorBut2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
}

- (void)selectorBut{
    TYBasedAnimationViewController *vc = [[TYBasedAnimationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)selectorBut1{
    TYKeyFramesViewController *vc = [[TYKeyFramesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)selectorBut2{
    TYGroupAnimationViewController *vc = [[TYGroupAnimationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
