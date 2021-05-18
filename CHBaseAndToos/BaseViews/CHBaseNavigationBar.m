//
//  CHBaseNavigationBar.m
//  CHSuperProduct
//
//  Created by 程浩MAC on 2020/11/11.
//  Copyright © 2020 程浩MAC. All rights reserved.
//

#import "CHBaseNavigationBar.h"


@interface CHBaseNavigationBar ()
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) CALayer *lineLayer;
@property (nonatomic, strong) UIView *leftTitleView;

@property (nonatomic, strong) UILabel *defaultTitleView;
@property (nonatomic, strong) UIButton *defaultLeftView;
@property (nonatomic, strong) UIButton *defaultRightView;


@end

@implementation CHBaseNavigationBar

+ (instancetype)navigationBar {
    return [[CHBaseNavigationBar alloc] init];
}
- (void)updateNavigationBar {

}


@end
