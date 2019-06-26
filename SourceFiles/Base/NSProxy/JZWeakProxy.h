//
//  JZWeakProxy.h
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
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
