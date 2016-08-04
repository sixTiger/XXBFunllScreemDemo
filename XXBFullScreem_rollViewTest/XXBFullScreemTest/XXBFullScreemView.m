//
//  XXBFullScreemView.m
//  XXBFullScreemTest
//
//  Created by baidu on 16/8/3.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBFullScreemView.h"
#import "XXBFullScreemControlBar.h"

@interface XXBFullScreemView ()
{
    CGRect                      identityFrame;
    XXBFullScreemControlBar     *fullScreemControlBar;
    
    
    UITextField                 *textFiled;
    UIImageView                 *imageView;
}
//@property(nonatomic , weak) UIWindow            *startWindow;
@end

@implementation XXBFullScreemView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor greenColor];
    
    imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    imageView.autoresizingMask = (1 << 6) - 1;
    imageView.image = [UIImage imageNamed:@"002"];
    
    fullScreemControlBar = [[XXBFullScreemControlBar alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 44, self.frame.size.width, 44)];
    fullScreemControlBar.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [self addSubview:fullScreemControlBar];

    textFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
    textFiled.backgroundColor = [UIColor blueColor];
    [self addSubview:textFiled];
    textFiled.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
}


- (void)setFullScreem:(BOOL)fullScreem {
    static int isFullScreen;
    _fullScreem = fullScreem;
    if (_fullScreem) {
        identityFrame = self.frame;
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = [self fullScreemFrame];
            self.transform =  CGAffineTransformMakeRotation(M_PI/2.0);
            [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.transform =  CGAffineTransformIdentity;
            self.frame = identityFrame;
            [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
        }];
    }
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        
        [invocation setTarget:[UIDevice currentDevice]];
                
        [invocation setArgument:&isFullScreen atIndex:2];
        
        [invocation invoke];
        
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.fullScreem = !self.isFullScreem;
    [textFiled endEditing:YES];
}

- (CGRect)fullScreemFrame {
    static CGRect fullScreemFrame;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        fullScreemFrame = CGRectMake(-(height - width) * 0.5, (height - width) * 0.5, height, width);
    });
    return fullScreemFrame;
    
}

@end
