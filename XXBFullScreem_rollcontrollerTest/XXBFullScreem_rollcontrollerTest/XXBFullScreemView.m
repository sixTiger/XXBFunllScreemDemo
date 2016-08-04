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
    _fullScreem = fullScreem;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  =  _fullScreem ? UIDeviceOrientationLandscapeLeft : UIDeviceOrientationPortrait;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [textFiled endEditing:YES];
}

@end
