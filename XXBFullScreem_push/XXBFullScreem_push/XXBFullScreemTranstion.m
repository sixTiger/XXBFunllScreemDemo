//
//  XXBFullScreemTranstion.m
//  XXBFullScreem_push
//
//  Created by baidu on 16/8/4.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBFullScreemTranstion.h"

@interface XXBFullScreemTranstion ()
{
    UIView  *transtionAnimationView;
    CGRect  currentFrame;
    BOOL    present;
}
@end

@implementation XXBFullScreemTranstion

- (void)fullScreemTransitionWithanimationView:(UIView *)animationView {
    transtionAnimationView = animationView;
    currentFrame = animationView.frame;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *nextVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromeVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (present) {
        fromeVC.view.hidden =  NO;
        transtionAnimationView.frame = currentFrame;
        transtionAnimationView.transform = CGAffineTransformIdentity;
    } else {
        fromeVC.view.hidden = YES;
        transtionAnimationView.frame = [UIScreen mainScreen].bounds;
        transtionAnimationView.transform =  CGAffineTransformMakeRotation(M_PI/2.0);
    }
    UIView *addView = nextVC.view;
    addView.frame = [UIScreen mainScreen].bounds;
    addView.hidden = present ? YES : NO;
    [[transitionContext containerView] addSubview:addView];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (present) {
            transtionAnimationView.frame = [self fullScreemFrame];
            transtionAnimationView.transform =  CGAffineTransformMakeRotation(M_PI/2.0);
        } else {
            transtionAnimationView.transform = CGAffineTransformIdentity;
            transtionAnimationView.frame = currentFrame;
        }
        [transtionAnimationView layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        addView.hidden = NO;
        [transitionContext completeTransition:YES];
        
    }];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    present = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    present = NO;
    return self;
}

- (CGRect)fullScreemFrame {
    static CGRect fullScreemFrame;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        fullScreemFrame = CGRectMake((height - width) * 0.5, - (height - width) * 0.5, width, height);
    });
    return fullScreemFrame;
}
@end
