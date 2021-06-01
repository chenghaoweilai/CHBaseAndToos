//
//  UIButton+ImageTitleSpace.m
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/22.
//

#import "UIButton+ImageTitleSpace.h"

@implementation UIButton (ImageTitleSpace)

- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space
{
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.f;
    CGFloat labelHeight = 0.f;
    
    labelWidth = self.titleLabel.intrinsicContentSize.width;
    labelHeight = self.titleLabel.intrinsicContentSize.height;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    switch (style) {
        case ButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight-space/2.0, 0);
        }
            break;
        case ButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case ButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWidth, 0, 0);
        }
            break;
        case ButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth-space/2.0, 0, imageWidth+space/2.0);
        }
            break;
        default:
            break;
    }
    
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

#pragma mark - 验证码倒计时
- (void)startTimeWithDuration:(NSInteger)duration {
    // 倒计时时间
    __block NSInteger timeOut = duration;
    __block NSString *defaultTitle = self.titleLabel.text;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if(timeOut <= 0) {
            // 倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                // 设置界面的按钮显示 根据自己需求设置
                NSMutableAttributedString*tncString = [[NSMutableAttributedString alloc] initWithString:defaultTitle];
                [tncString addAttribute:NSUnderlineStyleAttributeName
                                  value:@(NSUnderlineStyleSingle)
                                  range:(NSRange){0, [tncString length]}];
                [tncString addAttribute:NSForegroundColorAttributeName value:ComColor0x666666 range:NSMakeRange(0, [tncString length])];
                [tncString addAttribute:NSUnderlineColorAttributeName value:UIColorFromHex(0xCCCCCC) range:(NSRange){0, [tncString length]}];
                [self setAttributedTitle:tncString forState:UIControlStateNormal];
//                [self setTitle:defaultTitle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            timeOut--;
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *title = [NSString stringWithFormat:@"重新获取（%zd）", timeOut];
                NSMutableAttributedString*tncString = [[NSMutableAttributedString alloc] initWithString:title];
                [tncString addAttribute:NSUnderlineStyleAttributeName
                                  value:@(NSUnderlineStyleSingle)
                                  range:(NSRange){0, [tncString length]}];
                [tncString addAttribute:NSForegroundColorAttributeName value:ComColor0x666666 range:NSMakeRange(0, [tncString length])];
                [tncString addAttribute:NSUnderlineColorAttributeName value:UIColorFromHex(0xCCCCCC) range:(NSRange){0, [tncString length] - 1}];
                [tncString addAttribute:NSUnderlineColorAttributeName value:[UIColor whiteColor] range:(NSRange){[tncString length] - 1, 1}];
                [self setAttributedTitle:tncString forState:UIControlStateNormal];
//                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
        }
    });
    dispatch_resume(timer);
}

//- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//    return CGRectZero;
//}
//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//    return CGRectZero;
//}
//
//- (CGSize)sizeThatFits:(CGSize)size {
//    [super sizeThatFits:size];
//}

@end
