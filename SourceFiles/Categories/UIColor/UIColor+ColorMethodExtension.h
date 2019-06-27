//
//  UIColor+ColorMethodExtension.h
//
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorMethodExtension)
/**
 ！随机颜色
 @return UIColor
 */
+ (UIColor *)jh_colorsOfRandom;
/**
 ! 十进制颜色
 @param red 0~256
 @param green 0~256
 @param blue 0~256
 @param alpha 0~1
 @return UIColor
 */
+ (UIColor *)jh_decimalColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
/**
 ! 十进制颜色
 @param red 0~256
 @param green 0~256
 @param blue 0~256
 @param alpha 0~1
 @return UIColor
 */
+ (UIColor *)jh_decimalColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
/**
 ! 十六进制颜色
 @param hex 0xe5e5e5
 @return UIColor
 */
+ (UIColor *)jh_hexColorWithHex:(u_int32_t)hex;

/**
 ! 十六进制颜色
 @param hex 0xe5e5e5
 @param alpha 0~1
 @return UIColor
 */
+ (UIColor *)jh_hexColorWithHex:(u_int32_t)hex alpha:(CGFloat)alpha;
/**
 ! 十六进制颜色 => UIColor(RGB)
 @param color #000000
 @return UIColor
 */
+ (UIColor *)jh_colorWithHexString:(NSString *)color;

/**
 ! 十六进制颜色 => UIColor(RGB)
 @param color #000000
 @return UIColor
 */
+ (UIColor *)jh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end    
