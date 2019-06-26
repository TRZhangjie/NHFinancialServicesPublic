//
//  JZWeakProxy.h
//  BoxLove
//
//  Created by Code_浅蓝 on 2018/8/3.
//  Copyright © 2018年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZWeakProxy : NSProxy

/**
 用在NSTimer时， Must 注销NSTimer
 @param target 目前
 @return JZWeakProxy实例
 */
- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;
@end
