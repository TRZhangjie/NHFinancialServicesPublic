//
//  JZWeakProxy.m
//  BoxLove
//
//  Created by Code_浅蓝 on 2018/8/3.
//  Copyright © 2018年 张杰. All rights reserved.
//

#import "JZWeakProxy.h"
@interface JZWeakProxy()
@property (nonatomic, weak, readonly) id target;
@end
@implementation JZWeakProxy
- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}
+ (instancetype)proxyWithTarget:(id)target {
    return [[self alloc] initWithTarget:target];
}
- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = [invocation selector];
    if([self.target respondsToSelector:sel]){
        [invocation invokeWithTarget:self.target];
    }
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSAssert(self.target, @"目前对象失效, NSTimer必须注销");
    return [self.target methodSignatureForSelector:sel];
}
- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.target respondsToSelector:aSelector];
}

@end
