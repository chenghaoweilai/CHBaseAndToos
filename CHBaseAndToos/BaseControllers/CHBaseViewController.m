//
//  CHBaseViewController.m
//  CHSuperProduct
//
//  Created by 程浩MAC on 2020/11/11.
//  Copyright © 2020 程浩MAC. All rights reserved.
//

#import "CHBaseViewController.h"
#import "TextFontColorMacro.h"
@interface CHBaseViewController ()<CHNavigationBarDataSource, CHNavigationBarDelegate>
@property (nonatomic, assign) BOOL isFirstLoad;

@end

@implementation CHBaseViewController

#pragma mark 系统方法
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationController) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
    if (![self navigationBarAlwaysToFront:self.navigationBar]) {
        if (self.isFirstLoad) {
            self.isFirstLoad = NO;
            [self.view bringSubviewToFront:self.navigationBar];
        }
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFirstLoad = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.navigationBar.backgroundColor = [UIColor whiteColor];
    
    self.barStyle = UIStatusBarStyleDefault;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
//
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
    
    self.navigationBar.dataSource = self;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if ([self navigationBarAlwaysToFront:self.navigationBar]) {
        [self.view bringSubviewToFront:self.navigationBar];
    }
    CGFloat navHeight = [UIApplication sharedApplication].statusBarFrame.size.height + 44;
    self.navigationBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), navHeight);
    [self layoutSubviewsFrame];
}

- (void)layoutSubviewsFrame {}

- (void)createUI {}

//- (BOOL)shouldAutorotate {
//    return NO;
//}

- (BOOL)shouldAutorotate {
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
//    return UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscapeRight;

}
//一开始的方向  很重要
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

- (void)closeCurrentPage {
//    if (self.pageCloseBlock) {
//        self.pageCloseBlock();
//    }
}

- (void)setBarStyle:(UIStatusBarStyle)barStyle {
    if (_barStyle == barStyle) return;
    _barStyle = barStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return _barStyle;
}

- (UIColor *)navigationBarLineColor:(CHBaseNavigationBar *)navigationBar {
//    return [UIColor yt_navLineColor];
    return ColorDef0xf4f4f4;
}

- (BOOL)navigationBarNeedLine:(CHBaseNavigationBar *)navigationBar {
    return NO;
}
- (BOOL)navigationBarAlwaysToFront:(CHBaseNavigationBar *)navigationBar {
    return YES;
}
- (UIImage *)navigationBarLeftImage:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar {
//    button.backgroundColor = [UIColor redColor];
//    button.tintColor = [UIColor yt_colorWithHexString:@"#D8D8D8"];
    if (self.navigationController.viewControllers.count > 1) {
        return [UIImage imageNamed:@"nav_back_20x20_"];
    }
    return nil;
}

- (UIImage *)navigationBarRightImage:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar {
    button.backgroundColor = [UIColor clearColor];
    return nil;
}

- (NSAttributedString *)navigationBarTitle:(CHBaseNavigationBar *)navigationBar {
    NSString *title = self.navigationItem.title ?: self.title;
    if (title) {
        return [self attributeWithTitle:title];
    }
    return nil;
}

- (NSAttributedString *)attributeWithTitle:(NSString *)title {
    NSDictionary *attributes = @{NSFontAttributeName : FontPFSCBold(18),
//                                 NSForegroundColorAttributeName : [UIColor yt_navTitleColor]
                                 };
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:title attributes:attributes];
    return string;
}

- (void)didClickLeftButton:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar
{
    // 模态
    if (self.presentedViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    // push
    if (self.navigationController) {
        !self.finishbBlock?:self.finishbBlock();
        [self popoverPresentationController];
    }
    
}

- (void)didClickRightButton:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar
{
    
}

#pragma mark - Lazy
- (CHBaseNavigationBar *)navigationBar {
    if (!_navigationBar) {
        CHBaseNavigationBar *navigationBar = [CHBaseNavigationBar navigationBar];
        navigationBar.delegate = self;
//        navigationBar.backgroundColor = [UIColor yt_navBackWhiteColor];
        [self.view addSubview:navigationBar];
        _navigationBar = navigationBar;
    }
    return _navigationBar;
}

- (void)dealloc
{
    // iOS9 之后不需要添加移除通知方法 系统会帮我们移除
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(@"[%@] is dealloc ... ", NSStringFromClass(self.class));
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}
@end
