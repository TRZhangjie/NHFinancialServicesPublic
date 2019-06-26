//
//  JZWeakProxy.m
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
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
