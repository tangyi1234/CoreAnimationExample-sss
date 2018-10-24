//
//  TYBasedAnimationViewController.m
//  CoreAnimationExamplemodelModel
//
//  Created by 汤义 on 2018/10/23.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYBasedAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface TYBasedAnimationViewController ()
@property (nonatomic, weak) UIView *animationView;
@end

@implementation TYBasedAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"基础动画";
    [self addAnimationView];
    [self addButView];
}

- (void)addAnimationView{
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(W/2 - 60, 150, 120, 120)];
    animationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_animationView = animationView];
}

- (void)addButView{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, H - 40, 100, 30);
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"位移动画" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(115, H - 40, 100, 30);
    but1.backgroundColor = [UIColor redColor];
    [but1 setTitle:@"透明" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(230, H - 40, 100, 30);
    but2.backgroundColor = [UIColor redColor];
    [but2 setTitle:@"旋转" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(selectorBut2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    UIButton *but3 = [UIButton buttonWithType:UIButtonTypeCustom];
    but3.frame = CGRectMake(10, H - 75, 100, 30);
    but3.backgroundColor = [UIColor redColor];
    [but3 setTitle:@"缩放" forState:UIControlStateNormal];
    [but3 addTarget:self action:@selector(selectorBut3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but3];
    
    UIButton *but4 = [UIButton buttonWithType:UIButtonTypeCustom];
    but4.frame = CGRectMake(115, H - 75, 100, 30);
    but4.backgroundColor = [UIColor redColor];
    [but4 setTitle:@"背景色" forState:UIControlStateNormal];
    [but4 addTarget:self action:@selector(selectorBut4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but4];
}

- (void)selectorBut{
    //使用CABasicAnimation创建基础动画
    /**
     fromValue ： keyPath对应的初始值
     toValue ： keyPath对应的结束值
     
     如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。这里说的值比如说frame,这个属性一直没有变动。
     */
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, H/2-75)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(W, H/2-75)];
    anima.duration = 1.0f;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [_animationView.layer addAnimation:anima forKey:@"positionAnimation"];
    
    NSLog(@"这里的frame的值是多少:%f",_animationView.frame.origin.x);
}

- (void)selectorBut1{
    //透明度要用到opacity
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];//起始透明度
    anima.toValue = [NSNumber numberWithFloat:0.2f];//对应结束后的透明度
    anima.duration = 1.0f;
    [_animationView.layer addAnimation:anima forKey:@"opacityAniamtion"];
}

- (void)selectorBut2{
    //旋转
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
    anima.toValue = [NSNumber numberWithFloat:M_PI];//结束的位置
    anima.duration = 1.0f;
    [_animationView.layer addAnimation:anima forKey:@"rotateAnimation"];
}

/**
 缩放
 */
- (void)selectorBut3{
    //写入缩放transform.scale字符串名称
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//同上
    anima.toValue = [NSNumber numberWithFloat:2.0f]; //结束大小位置
    anima.duration = 1.0f;
    [_animationView.layer addAnimation:anima forKey:@"scaleAnimation"];
}

/**
 背景颜色的变化
 */
- (void)selectorBut4{
    //写入背景backgroundColor字符串名称
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor greenColor].CGColor;//结束颜色
    anima.duration = 1.0f;
    [_animationView.layer addAnimation:anima forKey:@"backgroundAnimation"];
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
