//
//  CHBaseNavigationBar.h
//  CHSuperProduct
//
//  Created by 程浩MAC on 2020/11/11.
//  Copyright © 2020 程浩MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTTStatusHeight     ([UIApplication sharedApplication].statusBarFrame.size.height)
#define kTTNavBarHeight     44.0f
#define kTTTopBarHeight     (kTTStatusHeight+kTTNavBarHeight)
#define kTTLineHeight       (1.0/[UIScreen mainScreen].scale)
#define kDefaultSpacing     30

NS_ASSUME_NONNULL_BEGIN
@class CHBaseNavigationBar;
@protocol CHNavigationBarDataSource <NSObject>

@optional
- (UIView *)navigationBarTitleView:(CHBaseNavigationBar *)navigationBar;
- (UIView *)navigationBarLeftView:(CHBaseNavigationBar *)navigationBar;
- (UIView *)navigationBarRightView:(CHBaseNavigationBar *)navigationBar;
//导航栏标题居左
- (UIView *)navigationBarLeftTitleView:(CHBaseNavigationBar *)navigationBar;

- (BOOL)navigationBarNeedLine:(CHBaseNavigationBar *)navigationBar;
- (UIColor *)navigationBarLineColor:(CHBaseNavigationBar *)navigationBar;
- (NSAttributedString *)navigationBarTitle:(CHBaseNavigationBar *)navigationBar;
- (UIImage *)navigationBarLeftImage:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar;
- (UIImage *)navigationBarRightImage:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar;
/** 导航栏始终在最上层 (默认YES) */
- (BOOL)navigationBarAlwaysToFront:(CHBaseNavigationBar *)navigationBar;
@end

@protocol CHNavigationBarDelegate <NSObject>
- (void)didClickLeftButton:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar;
- (void)didClickRightButton:(UIButton *)button navigationBar:(CHBaseNavigationBar *)navigationBar;
@end

@interface CHBaseNavigationBar : UIView
@property (nonatomic, strong, readonly) UIView *leftView;
@property (nonatomic, strong, readonly) UIView *rightView;
@property (nonatomic, strong, readonly) UIView *titleView;
@property (nonatomic, strong, readonly) UIView *leftTitleView;  //

@property (nonatomic, weak) id<CHNavigationBarDataSource> dataSource;
@property (nonatomic, weak) id<CHNavigationBarDelegate> delegate;

+ (instancetype)navigationBar;
/** 更新Bar */
- (void)updateNavigationBar;
@end




NS_ASSUME_NONNULL_END
