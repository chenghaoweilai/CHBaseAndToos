//
//  UIImage+CHMore.h
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CHMore)
/** 返回一张圆图片 */
- (UIImage *)ch_circleImage;
/** 返回一个带圆角的图片 */
- (UIImage *)ch_imageWithCornerRadius:(CGFloat)cornerRadius;
/** 返回一个带圆角,边框的图片 */
- (UIImage *)ch_imageWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/** 返回一个带圆角,边框的图片 */
- (UIImage *)ch_imageWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor rectCorner:(UIRectCorner)rectCorner;

/** 设置一张纯色的图片 */
+ (UIImage *)ch_imageWithColor:(UIColor *)color;
+ (UIImage *)ch_imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)ch_imageByResizeToSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
