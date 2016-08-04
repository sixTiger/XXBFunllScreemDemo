//
//  XXBFullScreemVC2.m
//  XXBFullScreem_push
//
//  Created by baidu on 16/8/4.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBFullScreemVC2.h"
#import "XXBFullScreemView.h"

@interface XXBFullScreemVC2 ()

@end

@implementation XXBFullScreemVC2

- (instancetype)init {
    if (self = [super init]) {
        [self initFullScreemView];
    }
    return self;
}

- (void)initFullScreemView {
    _canPush = YES;
    self.view.backgroundColor = [UIColor redColor];
    XXBFullScreemView * fullScreemView= [[XXBFullScreemView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:fullScreemView];
    fullScreemView.autoresizingMask = (1 << 6) - 1;
}

-  (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _canPush = NO;
    [self dismissViewControllerAnimated:YES completion:^{
        _canPush = YES;
    }];
}
@end
