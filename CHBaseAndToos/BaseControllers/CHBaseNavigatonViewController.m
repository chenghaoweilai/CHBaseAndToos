//
//  CHBaseNavigatonViewController.m
//  CHSuperProduct
//
//  Created by 程浩MAC on 2020/11/11.
//  Copyright © 2020 程浩MAC. All rights reserved.
//

#import "CHBaseNavigatonViewController.h"

@interface CHBaseNavigatonViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CHBaseNavigatonViewController

+ (void)initialize {
    // 设置一些导航的配置文件
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark 旋转屏幕相关
- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    UIInterfaceOrientationMask orientation = [self.topViewController supportedInterfaceOrientations];
    return orientation;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

#pragma mark 状态栏相关
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return self.topViewController.preferredStatusBarStyle;
//}

- (UIViewController *)childViewControllerForStatusBarStyle {
    
//    NSLog(@"topViewController:[%@]", NSStringFromClass(self.topViewController.class));
    
//    NSLog(@"topViewController:[%@]", NSStringFromClass([YTRoute shareInstance].topViewController.class));
    
    UIViewController *topViewController = self.topViewController;
//    topViewController = [YTRoute shareInstance].topViewController;
    
    return topViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}
//
//- (BOOL)prefersStatusBarHidden {
//    return self.topViewController.prefersStatusBarHidden;
//}
#pragma mark 入栈出栈相关
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0;
    [self.topViewController.view endEditing:YES];
    [super pushViewController:viewController animated:animated];
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [self.topViewController.view endEditing:YES];
    return [super popViewControllerAnimated:animated];
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    
    if (self.interactivePopGestureRecognizer.enabled) {
        // 是够支持侧滑交互
        BOOL canInteractive = self.viewControllers.count > 1;
        return canInteractive;
    }

    return NO;
}

@end
