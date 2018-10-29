//
//  TYExcessiveAnimationViewController.m
//  CoreAnimationExamplemodelModel
//
//  Created by 汤义 on 2018/10/29.
//  Copyright © 2018年 汤义. All rights reserved.
//  过度动画

#import "TYExcessiveAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface TYExcessiveAnimationViewController ()
@property (nonatomic, weak) UIView *animationView;

@property (nonatomic, weak) UILabel *demoLabel;

@property (nonatomic, assign) NSInteger index;
@end

@implementation TYExcessiveAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     CATransition
     CAAnimation的子类，用于做过渡动画或者转场动画，能够为层提供移出屏幕和移入屏幕的动画效果。
     重要属性
     type：动画过渡类型
     
     Apple 官方的SDK其实只提供了四种过渡效果。
     
     kCATransitionFade 渐变效果
     kCATransitionMoveIn 进入覆盖效果
     kCATransitionPush 推出效果
     kCATransitionReveal 揭露离开效果
     私有API提供了其他很多非常炫的过渡动画，比如@"cube"、@"suckEffect"、@"oglFlip"、 @"rippleEffect"、@"pageCurl"、@"pageUnCurl"、@"cameraIrisHollowOpen"、@"cameraIrisHollowClose"等。
     注意点
     私有api，不建议开发者们使用。因为苹果公司不提供维护，并且有可能造成你的app审核不通过。
     subtype：动画过渡方向
     
     kCATransitionFromRight 从右侧进入
     kCATransitionFromLeft 从左侧进入
     kCATransitionFromTop 从顶部进入
     kCATransitionFromBottom 从底部进入
     startProgress：动画起点(在整体动画的百分比)
     endProgress：动画终点(在整体动画的百分比)
     */
    [self addAnimationView];
    [self addButView];
}

- (void)addAnimationView{
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(W/2 - 60, 100, 120, 120)];
    animationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_animationView = animationView];
    
    UILabel *demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(animationView.frame)/2-10, CGRectGetHeight(animationView.frame)/2-20, 20, 40)];
    demoLabel.textAlignment = NSTextAlignmentCenter;
    demoLabel.font = [UIFont systemFontOfSize:40];
    [animationView addSubview:_demoLabel = demoLabel];
    
    [self changeView:YES];
}

- (void)addButView{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, H - 40, 100, 30);
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"渐进" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(115, H - 40, 100, 30);
    but1.backgroundColor = [UIColor redColor];
    [but1 setTitle:@"滑动" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(220, H - 40, 100, 30);
    but2.backgroundColor = [UIColor redColor];
    [but2 setTitle:@"push" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(selectorBut2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    UIButton *but3 = [UIButton buttonWithType:UIButtonTypeCustom];
    but3.frame = CGRectMake(10, H - 75, 100, 30);
    but3.backgroundColor = [UIColor redColor];
    [but3 setTitle:@"推出" forState:UIControlStateNormal];
    [but3 addTarget:self action:@selector(selectorBut3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but3];
    
    UIButton *but4 = [UIButton buttonWithType:UIButtonTypeCustom];
    but4.frame = CGRectMake(115, H - 75, 100, 30);
    but4.backgroundColor = [UIColor redColor];
    [but4 setTitle:@"翻滚" forState:UIControlStateNormal];
    [but4 addTarget:self action:@selector(selectorBut4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but4];
    
    UIButton *but5 = [UIButton buttonWithType:UIButtonTypeCustom];
    but5.frame = CGRectMake(220, H - 75, 100, 30);
    but5.backgroundColor = [UIColor redColor];
    [but5 setTitle:@"翻滚" forState:UIControlStateNormal];
    [but5 addTarget:self action:@selector(selectorBut5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but5];
}

/**
 渐进的动画，kCATransitionFade 渐变效果 。kCATransitionFromRight 从右侧进入
 */
- (void)selectorBut{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    //anima.startProgress = 0.3;//设置动画起点
    //anima.endProgress = 0.8;//设置动画终点
    anima.duration = 1.0f;
    
    [_animationView.layer addAnimation:anima forKey:@"fadeAnimation"];
}

/**
 滑动动画，类似推拉门,原来的不动，后面的将前面的覆盖掉。kCATransitionMoveIn 进入覆盖效果。还要配合字符串moveInAnimation
 */
- (void)selectorBut1{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionMoveIn;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_animationView.layer addAnimation:anima forKey:@"moveInAnimation"];
}

/**
 也是滑动，这里的效果是，新的将旧的推出。类似我们是开发中的push。
 */
- (void)selectorBut2{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionPush;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_animationView.layer addAnimation:anima forKey:@"pushAnimation"];
}

/**
 这也是滑动，是推出效果。有中间位置推出到外面。kCATransitionReveal 揭露离开效果
 */
- (void)selectorBut3{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionReveal;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_animationView.layer addAnimation:anima forKey:@"revealAnimation"];
}

/**
 *  立体翻滚效果,翻滚效果是根据cube和revealAnimation来实现的。
 */
- (void)selectorBut4{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_animationView.layer addAnimation:anima forKey:@"revealAnimation"];
}

- (void)selectorBut5{
    
}

/**
 *   设置view的值
 */
-(void)changeView : (BOOL)isUp{
    if (_index>3) {
        _index = 0;
    }
    if (_index<0) {
        _index = 3;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    NSArray *titles = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    _animationView.backgroundColor = [colors objectAtIndex:_index];
    _demoLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
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
