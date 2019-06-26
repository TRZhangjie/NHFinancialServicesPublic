//
//  NSDictionary+SpecifiedFormat.h
//   
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SpecifiedFormat)

- (NSDictionary *)dictionaryByReplacingNullsWithStrings;
- (NSDictionary *)getClassInfoWithClass:(id)newClass;
@end

NS_ASSUME_NONNULL_END
