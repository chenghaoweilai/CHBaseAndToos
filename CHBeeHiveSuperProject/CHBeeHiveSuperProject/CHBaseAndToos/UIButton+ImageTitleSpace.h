//
//  UIButton+ImageTitleSpace.h
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle){
    ButtonEdgeInsetsStyleTop,       // 图片在上 文字在下
    ButtonEdgeInsetsStyleBottom,    // 图片在下 文字在上
    ButtonEdgeInsetsStyleLeft,      // 图片在左 文字在右
    ButtonEdgeInsetsStyleRight,     // 图片在右 文字在左
};

@interface UIButton (ImageTitleSpace)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

/**
 验证码倒计时
 
 @param duration 时间
 */
- (void)startTimeWithDuration: (NSInteger)duration;

@end

NS_ASSUME_NONNULL_END
