//
//  Student.m
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
#import "NSObject+SZExtension.h"
@implementation Student

/**
 假设我们有100个属性，但是只需要归档80个 ，利用上面的代码怎么做？
 ﻿使用一个忽略的数组 ，然后再在归档操作中进行判断，如果是忽略的属性就跳过归档
 */

- (NSArray *)ignoredNames{
    return @[@"_sss"];
}
//宏定义的实现  归档解档
decodeAndEncode;
@end
