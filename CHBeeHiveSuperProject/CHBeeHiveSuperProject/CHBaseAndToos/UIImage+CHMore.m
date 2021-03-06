//
//  UIImage+CHMore.m
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/22.
//

#import "UIImage+CHMore.h"

@implementation UIImage (CHMore)

- (UIImage *)ch_circleImage {
    CGSize size = self.size;
    float corner = MIN(size.width, size.height);
    return [self ch_imageWithCornerRadius:corner];
}

- (UIImage *)ch_imageWithCornerRadius:(CGFloat)cornerRadius {
    return [self ch_imageWithCornerRadius:cornerRadius borderWidth:0 borderColor:nil];
}

- (UIImage *)ch_imageWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    return [self ch_imageWithCornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor rectCorner:UIRectCornerAllCorners];
}

- (UIImage *)ch_imageWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor rectCorner:(UIRectCorner)rectCorner {
    
    CGRect rect = (CGRect){0, 0, self.size};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (cornerRadius > 0) {
        rect = CGRectMake(borderWidth/2, borderWidth/2, self.size.width-borderWidth, self.size.height-borderWidth);
        // [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        CGContextAddPath(context, path.CGPath);
        if (borderWidth > 0) {
            CGContextSetLineWidth(context, borderWidth);
            CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
            CGContextDrawPath(context, kCGPathFillStroke);
        } else {
            
        }
        [path addClip];
    } else {
        if (borderWidth > 0) {
            rect = CGRectMake(borderWidth/2, borderWidth/2, self.size.width-borderWidth, self.size.height-borderWidth);
            CGContextSetLineWidth(context, borderWidth);
            CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
            CGContextStrokeRect(context, rect);
        } else {
            
        }
    }
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (UIImage *)ch_imageWithColor:(UIColor *)color {
    return [self ch_imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

+ (UIImage *)ch_imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ch_imageByResizeToSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
