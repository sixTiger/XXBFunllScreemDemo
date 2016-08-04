//
//  XXBFullScreemVC.m
//  XXBFullScreemTest
//
//  Created by baidu on 16/8/3.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBFullScreemVC.h"
#import "XXBFullScreemView.h"

@interface XXBFullScreemVC ()
@property(nonatomic ,weak) XXBFullScreemView * fullScreemView;
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

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.fullScreemView.fullScreem = !self.fullScreemView.isFullScreem;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)initFullScreemView {
    XXBFullScreemView * fullScreemView= [[XXBFullScreemView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width * 9 / 16.0 )];
    [self.view addSubview:fullScreemView];
    _fullScreemView = fullScreemView;
}

@end
