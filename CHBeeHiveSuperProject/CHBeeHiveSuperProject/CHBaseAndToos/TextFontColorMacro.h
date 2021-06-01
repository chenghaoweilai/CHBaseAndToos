//
//  TextFontColorMacro.h
//  CHSuperProduct
//
//  Created by 程浩MAC on 2020/11/14.
//  Copyright © 2020 程浩MAC. All rights reserved.
//

#ifndef TextFontColorMacro_h
#define TextFontColorMacro_h

/**************************************************************/
#pragma mark - 颜色类相关

// 十六进制值取色(HEX, alpha)
#define UIColorFromHexA(rgbValue, alp)          [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0    \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0       \
blue:((float)(rgbValue & 0xFF)) / 255.0                \
alpha:alp]

// 获取RGB Alpha颜色
#define UIColorFromRGBA(R, G, B, A)             [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
// 十六进制值取色(HEX)
#define UIColorFromHex(rgbValue)                UIColorFromHexA(rgbValue, 1.0)
// 获取RGB颜色
#define UIColorFromRGB(R, G, B)                 UIColorFromRGBA(R, G, B, 1.0f)

// 随机色
#define kRandomColor UIColorFromRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#pragma mark - App主题相关
/**************************************************************/
#define WhiteColor               UIColorFromHex(0xffffff)
#define AppRedColor              [UIColor redColor]
#define AppBlackColor            [UIColor blackColor]
#define ClearColor               [UIColor clearColor]
#define AppThemeColor            UIColorFromHex(0xF4504A)
/**************************************************************/
// 常见颜色宏定义
#define ColorDef0x043796            UIColorFromHex(0x043796)
#define ColorDef0xf4f4f4            UIColorFromHex(0xf4f4f4)
#define ColorDef0xfefefe            UIColorFromHex(0xfefefe)
#define ColorDef0x333333            UIColorFromHex(0x333333)
#define ColorDef0xeeeeee            UIColorFromHex(0xeeeeee)
#define ColorDef0xe6e6e6            UIColorFromHex(0xe6e6e6)
#define ColorDef0x666666            UIColorFromHex(0x666666)
#define ColorDef0x999999            UIColorFromHex(0x999999)
#define ColorDef0xf2f2f2            UIColorFromHex(0xf2f2f2)
#define ColorDef0xcccccc            UIColorFromHex(0xcccccc)
#define ColorDef0xc4c4c4            UIColorFromHex(0xc4c4c4)
#define ColorDef0xa8a8a8            UIColorFromHex(0xa8a8a8)
#define ColorDef0xffffff            UIColorFromHex(0xffffff)

// 字体大小缩放
#define FontSizeScale(size)         size //((kMainScreenWidth / 375) * size)
// 坐标大小缩放
#define CoordXSizeScale(size)       ((kMainScreenWidth / 375.) * size)
#define CoordYSizeScale(size)       ((kMainScreenHeight / 667.) * size)

// SF字体
#define FontPFRegular(fSize)        [UIFont fontWithName:@"SFProDisplay-Regular" size:FontSizeScale(fSize)] ?: [UIFont systemFontOfSize:fSize]
#define FontPFSCBold(fSize)         [UIFont fontWithName:@"SFProDisplay-Semibold" size:FontSizeScale(fSize)] ?: [UIFont boldSystemFontOfSize:fSize]

// 自定义字体
//#define FontFZCuYuan(fSize)     [UIFont fontWithName:@"FZCuYuan-M03S" size:FontSizeScale(fSize)] ?: [UIFont systemFontOfSize:fSize]
//#define FontFZZhunYuan(fSize)    [UIFont fontWithName:@"FZZhunYuan-M02S" size:FontSizeScale(fSize)] ?: [UIFont systemFontOfSize:fSize]
#define FontBold(fSize)      [UIFont boldSystemFontOfSize:fSize]
#define FontDef(fSize)    [UIFont systemFontOfSize:fSize]
#endif /* TextFontColorMacro_h */
