//  Inkwell
//  InkwellFrameMarco.h
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//
// @ description 布局

#ifndef InkwellFrameMarco
#define InkwellFrameMarco

/****************************设备判断**************************************/

/*! UIWindow*/
#define kWindow         [(AppDelegate *)[UIApplication sharedApplication].delegate mainWindow]

/*! 底部安全区域*/
#define SafeAreaBottomHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20? 34.0f : 0.0f)

/*! 状态栏高度*/
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

/*! 导航栏高度*/
#define kNavBarHeight 44.0

/*! Tabbar高度*/
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

/*! 距离顶部距离*/
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

/*! 屏幕宽*/
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

/*! 屏幕高*/
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))

#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define SCREEN_MAX_WIDTH ((CGRectGetWidth([UIScreen mainScreen].bounds) > CGRectGetHeight([UIScreen mainScreen].bounds))?(CGRectGetHeight([UIScreen mainScreen].bounds)):(CGRectGetWidth([UIScreen mainScreen].bounds)))

#define SCREEN_MAX_Height ((CGRectGetWidth([UIScreen mainScreen].bounds) > CGRectGetHeight([UIScreen mainScreen].bounds))?(CGRectGetWidth([UIScreen mainScreen].bounds)):(CGRectGetHeight([UIScreen mainScreen].bounds)))

/*! 屏幕高度适配 6、6s*/
#define kAdpatHeight(value) (value * (SCREEN_MAX_Height > 667.0f ? 667.0f : SCREEN_MAX_Height) / (SCREEN_MAX_Height != 667.0f ? 667.0f : SCREEN_MAX_Height))


/*! 屏幕宽度适配 6、6s*/
#define kAdpatWidth(value)  (value * SCREEN_MAX_WIDTH / (SCREEN_MAX_WIDTH != 375.0f ? 375.0f : SCREEN_MAX_WIDTH))

#define Adapted(value) (value * SCREEN_MAX_WIDTH / (SCREEN_MAX_WIDTH != 375.0f ? 375.0f : SCREEN_MAX_WIDTH))


/*! 屏幕高度适配 5、5s*/
#define kAdpatHeightIpone5(value) (value * SCREEN_MAX_Height / (SCREEN_MAX_Height != 568.0f ? 568.0f : SCREEN_MAX_Height))

/*! 屏幕宽度适配 5、5s*/
#define kAdpatWidthIpone5(value)  (value * SCREEN_MAX_WIDTH / (SCREEN_MAX_WIDTH != 320.0f ? 320.0f : SCREEN_MAX_WIDTH))

/****************************设备判断**************************************/

/*! 判断是否为iPhone */
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/*! 判断是否为iPad */
#define IS_TR_Pad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/*! 判断是否为ipod */
#define WB_IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/*! RETINA */
#define IS_TR_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

/*! iPhone4 or iPhone4s */
#define IS_TR_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

/*! iPhone5 or iPhone5s */
#define IS_TR_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)

/*! iPhone6 or iPhone6s */
#define IS_TR_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)

/*! iPhone6Plus or iPhone6sPlus */
#define IS_TR_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

/*! iPhone X or iPhone Xs*/
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

/*! iPhone Xr or iPhone XMax*/
#define IS_IPHONE_XR (IS_IPHONE && SCREEN_MAX_LENGTH == 896.0f)

/****************************系统版本**************************************/
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define IS_IOS7 (IOS_VERSION >= 7.0 ? YES : NO)

#define IS_IOS8 (IOS_VERSION >= 8.0 ? YES : NO)

#define IS_IOS9 (IOS_VERSION >= 9.0 ? YES : NO)

#define IS_IOS9_1 (IOS_VERSION >= 9.1 ? YES : NO)

#define IS_IOS9_Before (IOS_VERSION < 9.0 ? YES : NO)

#define IS_IOS10 (IOS_VERSION >= 10.0 ? YES : NO)

#define IS_IOS11 (IOS_VERSION >= 11.0 ? YES : NO)

#endif /* InkwellFrameMarco_h */
