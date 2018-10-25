//
//  TYGroupAnimationViewController.m
//  CoreAnimationExamplemodelModel
//
//  Created by 汤义 on 2018/10/25.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYGroupAnimationViewController.h"

@interface TYGroupAnimationViewController ()
@property (nonatomic, weak) UIView *animationView;
@end

@implementation TYGroupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     CAAnimationGroup动画组
     animations : 用来保存一组动画对象的NSArray
     */
    self.title = @"组动画";
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
    [but setTitle:@"同时" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(112, H - 40, 100, 30);
    but1.backgroundColor = [UIColor redColor];
    [but1 setTitle:@"顺序执行" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
}

/**
 同时
 如果我们不做顺序进行执行的，他会同时将我们加入进来的动画，一起进行执行。
 */
- (void)selectorBut{
    
    //    //位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, H/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(W/3, H/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(W/3, H/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(W*2/3, H/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(W*2/3, H/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(W, H/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    //组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima2,anima3, nil];
    groupAnimation.duration = 4.0f;
    
    [_animationView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

/**
 安指定的顺序执行
 */
- (void)selectorBut1{
    CFTimeInterval currentTime = CACurrentMediaTime();
    //位移动画
    CABasicAnimation *anima1 = [CABasicAnimation animationWithKeyPath:@"position"];
    anima1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, H/2-75)];
    anima1.toValue = [NSValue valueWithCGPoint:CGPointMake(W/2, H/2-75)];
    anima1.beginTime = currentTime;
    anima1.duration = 1.0f;
    anima1.fillMode = kCAFillModeForwards;
    anima1.removedOnCompletion = NO;
    [_animationView.layer addAnimation:anima1 forKey:@"aa"];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    anima2.beginTime = currentTime+1.0f;
    anima2.duration = 1.0f;
    anima2.fillMode = kCAFillModeForwards;
    anima2.removedOnCompletion = NO;
    [_animationView.layer addAnimation:anima2 forKey:@"bb"];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    anima3.beginTime = currentTime+2.0f;
    anima3.duration = 1.0f;
    //这两句话的意思是，执行完后执行在最后一个状态上。
    anima3.fillMode = kCAFillModeForwards;
    anima3.removedOnCompletion = NO;
    [_animationView.layer addAnimation:anima3 forKey:@"cc"];
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
