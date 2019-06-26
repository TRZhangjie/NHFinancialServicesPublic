//
//  UIColor+ColorMethodExtension.m
//
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//

#import "UIColor+ColorMethodExtension.h"

@implementation UIColor (ColorMethodExtension)
/**
 ！随机颜色
 @return UIColor
 */
+ (UIColor *)jh_colorsOfRandom{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0f
                           green:arc4random_uniform(256)/255.0f
                            blue:arc4random_uniform(256)/255.0f
                           alpha:1];
}
/**
 ! 十进制颜色
 @param red 0~256
 @param green 0~256
 @param blue 0~256
 @param alpha 0~1
 @return UIColor
 */
+ (UIColor *)jh_decimalColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return  [self jh_decimalColorWithRed:red green:green blue:blue alpha:1];
}
/**
 ! 十进制颜色
 @param red 0~256
 @param green 0~256
 @param blue 0~256
 @param alpha 0~1
 @return UIColor
 */
+ (UIColor *)jh_decimalColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f
                           green:green/255.0f
                            blue:blue/255.0f
                           alpha:alpha];
}
/**
 ! 十六进制颜色
 @param hex 0xe5e5e5
 @param alpha 0~1
 @return UIColor
 */
+ (UIColor *)jh_hexColorWithHex:(u_int32_t)hex {
    return [self jh_hexColorWithHex:hex alpha:1];
}
/**
 ! 十六进制颜色
 @param hex 0xe5e5e5
 @param alpha 0~1
 @return UIColor
 */
+ (UIColor *)jh_hexColorWithHex:(u_int32_t)hex alpha:(CGFloat)alpha {
    
    int red = (hex & 0xFF0000) >> 16;
    
    int green = (hex & 0x00FF00) >> 8;
    
    int blue = hex & 0x0000FF;
    
    return [UIColor colorWithRed:red/255.0
                           green:green/255.0
                            blue:blue/255.0
                           alpha:alpha];
}
/**
 ! 十六进制颜色 => UIColor(RGB)
 @param color #000000
 @return UIColor
 */
+ (UIColor *)jh_colorWithHexString:(NSString *)color {
    return [self jh_colorWithHexString:color alpha:1];
}
/**
 ! 十六进制颜色 => UIColor(RGB)
 @param color #000000
 @return UIColor
 */
+ (UIColor *)jh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
    cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
    cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
    return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end

