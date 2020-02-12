//
//  FlipPresentAnimationController.m
//  CoreAnimationDemo
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "FlipPresentAnimationController.h"

@implementation FlipPresentAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toVC.view];
    toVC.view.alpha = 0.0;
    CGFloat duration = [self transitionDuration:transitionContext];
    toVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:20 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
        toVC.view.alpha = 1.0;
        } completion:^(BOOL finished){
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
     ];

}
@end
