//  Inkwell
//  InkwellNounMacro.h
//   
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//

#ifndef InkwellNounMacro_h
#define InkwellNounMacro_h


#define InkWeakSelf   __weak typeof(self) weakSelf = self;
#define InkWeakSelf   __weak typeof(self) weakSelf = self;
#define InkStrongSelf __strong typeof(self) strongSelf = self;
#define InkWeakRefrence(type)  __weak typeof(type) weak##type = type



/*！Bundle资源*/
#define zj_BundleResource(name, type) [[NSBundle mainBundle] pathForResource:imageName ofType:type]
#define zj_BundleImage(imgName, type) [UIImage imageWithContentsOfFile:zjBundleResource(imgName,type)]
#define zj_BundlePNGImage(imgName) [UIImage imageWithContentsOfFile:zjBundleResource(imgName,@"png")]

/*! NSFileManager*/
#define zj_MSFileManager [NSFileManager defaultManager]

/* ! 通知中心*/
#define zj_NotificationDefault [NSNotificationCenter defaultCenter]

/*! 获取APP的名字 */
#define zj_APP_Name [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]

/*! 获取APP的版本号 */
#define zj_APP_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/*! 获取App短式版本号 */
#define zj_APP_VersionShort [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/*! 建议使用这个方法 */
#define zj_SYSTEM_Version [[UIDevice currentDevice] systemVersion]

/*! 检索本地化字符串 */
#define WBLocalizedString(key, comment) NSLocalizedString(key, comment)


#endif /* InkwellNounMacro_h */
