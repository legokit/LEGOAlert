//
//  FlipDismissAnimationController.m
//  CoreAnimationDemo
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//

#import "FlipDismissAnimationController.h"
@implementation FlipDismissAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.75;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//    UIViewController *fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIView *containerView = [transitionContext containerView];
//
//    [containerView addSubview:fromVC.view];
//    CGFloat duration = [self transitionDuration:transitionContext];
//
//    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:10 initialSpringVelocity:20 options:UIViewAnimationOptionCurveLinear animations:^{
//        fromVC.view.alpha = 0.0;
//    } completion:^(BOOL finished){
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//    }
//    ];
    
}

@end
