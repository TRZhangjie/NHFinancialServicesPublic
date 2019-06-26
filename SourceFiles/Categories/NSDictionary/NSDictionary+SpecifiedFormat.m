//
//  NSDictionary+SpecifiedFormat.m
//   
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//

#import "NSDictionary+SpecifiedFormat.h"
#import <objc/runtime.h>

@implementation NSDictionary (SpecifiedFormat)

/**
 清除字典中的<null>
 
 @return NSDictionary
 */
- (NSDictionary *)dictionaryByReplacingNullsWithStrings {
    
    const NSMutableDictionary *replaced = [self mutableCopy];
    
    const id nul = [NSNull null];
    
    const NSString *blank = @"";
    
    for(NSString *key in self) {
        const id object = [self objectForKey:key];
        if(object == nul) {
            //pointer comparison is way faster than -isKindOfClass:
            //since [NSNull null] is a singleton, they'll all point to the same
            //location in memory.
            [replaced setObject:blank
                         forKey:key];
        }
    }
    
    return [replaced copy];
    
}
- (NSDictionary *)getClassInfoWithClass:(id)newClass {
    
    
    
    NSMutableArray * keys = [NSMutableArray array];
    
    NSMutableArray * attributes = [NSMutableArray array];
    
    unsigned int outCount;
    
    objc_property_t * properties = class_copyPropertyList([newClass class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        
        objc_property_t property = properties[i];
        
        //通过property_getName函数获得属性的名字
        NSString * propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [keys addObject:propertyName];
        
        //通过property_getAttributes函数可以获得属性的名字和@encode编码
        NSString * propertyAttribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        [attributes addObject:propertyAttribute];
    }
    //立即释放properties指向的内存
    free(properties);
    
    
    return @{@"keys":keys, @"attributes":attributes};
    
}

@end
