//
//  CHBaseViewController.h
//  CHSuperProduct
//
//  Created by 程浩MAC on 2020/11/11.
//  Copyright © 2020 程浩MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHBaseNavigationBar.h"
#import "TextFontColorMacro.h"
NS_ASSUME_NONNULL_BEGIN

@interface CHBaseViewController : UIViewController
@property (nonatomic, assign) UIStatusBarStyle barStyle;
@property (nonatomic, strong) CHBaseNavigationBar *navigationBar;

/** 页面关闭的回调 */
//@property (nonatomic, copy) YTCloseBlock pageCloseBlock;
@property (nonatomic, copy) void (^finishbBlock)();//返回

/** 执行pageCloseBlock 事件 */
- (void)closeCurrentPage;

/** 创建UI */
- (void)createUI;

@end

NS_ASSUME_NONNULL_END
