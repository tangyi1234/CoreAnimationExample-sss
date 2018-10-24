//
//  TYKeyFramesViewController.m
//  CoreAnimationExamplemodelModel
//
//  Created by 汤义 on 2018/10/24.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYKeyFramesViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TYKeyFramesViewController ()<CAAnimationDelegate>
@property (nonatomic, weak) UIView *animationView;
@end

@implementation TYKeyFramesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关键帧动画";
    /**
     重要属性
     values ： 就是上述的NSArray对象。里面的元素称为”关键帧”(keyframe)。动画对象会在指定的时间(duration)内，依次显示values数组中的每一个关键帧
     path ： 可以设置一个CGPathRef\CGMutablePathRef,让层跟着路径移动。path只对CALayer的anchorPoint和position起作用。如果你设置了path，那么values将被忽略。
     keyTimes ： 可以为对应的关键帧指定对应的时间点,其取值范围为0到1.0,keyTimes中的每一个时间值都对应values中的每一帧.当keyTimes没有设置的时候,各个关键帧的时间是平分的。
     */
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
    [but setTitle:@"关键帧" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1= [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(115, H - 40, 100, 30);
    but1.backgroundColor = [UIColor redColor];
    [but1 setTitle:@"路径" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
}
/**
 关键帧
 */
- (void)selectorBut{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //路径组
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, H/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(W/3, H/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(W/3, H/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(W*2/3, H/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(W*2/3, H/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(W, H/2-50)];
    anima.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    anima.duration = 2.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//设置动画的节奏
    anima.delegate = self;//设置代理，可以检测动画的开始和结束
    [_animationView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
}

/**
 路径
 */
- (void)selectorBut1{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(W/2-100, H/2-100, 200, 200)];
    anima.path = path.CGPath;
    anima.duration = 2.0f;
    [_animationView.layer addAnimation:anima forKey:@"pathAnimation"];
}

-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始动画");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"结束动画");
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
