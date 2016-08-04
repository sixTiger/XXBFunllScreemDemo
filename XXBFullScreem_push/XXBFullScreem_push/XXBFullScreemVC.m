//
//  XXBFullScreemVC.m
//  XXBFullScreemTest
//
//  Created by baidu on 16/8/3.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBFullScreemVC.h"
#import "XXBFullScreemView.h"
#import "XXBFullScreemVC2.h"
#import "XXBFullScreemTranstion.h"

@interface XXBFullScreemVC ()
@property(nonatomic ,weak) XXBFullScreemView            *fullScreemView;
@property(nonatomic ,strong) XXBFullScreemVC2           *fullScreemVC2;
@property(nonatomic ,strong) XXBFullScreemTranstion     *fullScreemTranstion;
@end

@implementation XXBFullScreemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initFullScreemView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.fullScreemView.fullScreem = !self.fullScreemView.isFullScreem;
    if (self.fullScreemVC2.canPush == NO) {
        return;
    }
    [self presentViewController:self.fullScreemVC2 animated:YES completion:^{
        
    }];
}

- (void)initFullScreemView {
    XXBFullScreemView * fullScreemView= [[XXBFullScreemView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width * 9 / 16.0 )];
    [self.view addSubview:fullScreemView];
    _fullScreemView = fullScreemView;
    
    self.fullScreemVC2 = [[XXBFullScreemVC2 alloc] init];
    
    _fullScreemTranstion = [[XXBFullScreemTranstion alloc] init];
    [_fullScreemTranstion fullScreemTransitionWithanimationView:_fullScreemView];
    
    self.fullScreemVC2.transitioningDelegate = _fullScreemTranstion;
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
    return UIInterfaceOrientationMaskPortrait;
}
@end
