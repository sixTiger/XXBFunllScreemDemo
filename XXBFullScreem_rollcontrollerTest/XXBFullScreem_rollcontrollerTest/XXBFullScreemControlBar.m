//
//  XXBFullScreemControlBar.m
//  XXBFullScreemTest
//
//  Created by baidu on 16/8/3.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBFullScreemControlBar.h"

@interface XXBFullScreemControlBar()
{
    UITabBar            *tabbar;
    UIButton            *playButton;
}
@end

@implementation XXBFullScreemControlBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    CGFloat selfWidth = self.bounds.size.width;
    CGFloat selfHeight = self.bounds.size.height;
    tabbar = [[UITabBar alloc] initWithFrame:self.bounds];
    tabbar.alpha = 0.5;
    tabbar.barStyle = UIBarStyleBlack;
    [self addSubview:tabbar];
    tabbar.tintColor = [UIColor redColor];
    tabbar.autoresizingMask = (1 << 6) - 1;
    
    playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:playButton];
    playButton.frame = CGRectMake(0, 0,selfWidth,selfWidth);
    playButton.center = CGPointMake(selfWidth * 0.5, selfHeight * 0.5);
    [playButton setTitle:@"ON" forState:UIControlStateNormal];
    [playButton setTitle:@"OFF" forState:UIControlStateHighlighted];
    playButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
}

@end
