//
//  NSObject+SZExtension.m
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "NSObject+SZExtension.h"
#import <objc/runtime.h>
@implementation NSObject (SZExtension)

//归档
- (void)encoder:(NSCoder *)encoder{
    
    //保存成员属性的个数
    unsigned int count = 0;
    //获取student类的所有成员变量
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    //遍历
    for (int i = 0 ; i < count; i++) {
        //取出i对应的成员属性
        Ivar ivar = ivars[i];
        //这里获取的属性他的类型不相同 ，所以有转换为oc的字符串对象
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)]; //属性的名称
        
        //        NSLog(@"%@",key); //name  age 。。。
        
        //在这里需要判断
        if ([self respondsToSelector:@selector(ignoredNames)]) {

            if( [[self ignoredNames] containsObject:key]) continue;
        }
        
        //通过key获得对应成员变量的值
        id  value = [self valueForKeyPath:key]; //我们设置的值
        
        //进行归档 ，在根据我们设置的  值 ： 属性  进行存储  一样。。
        [encoder encodeObject:value forKey:key];
    }
     free(ivars);
}

//解档
- (void)decoder:(NSCoder *)decoder
{
    //保存成员属性的个数
    unsigned int count = 0;
    //获取student类的所有成员变量
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    //遍历
    for (int i = 0 ; i < count; i++) {
        //取出i对应的成员属性
        Ivar ivar = ivars[i];
        //这里获取的属性他的类型不相同 ，所以有转换为oc的字符串对象
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)]; //属性的名称
        
        //在这里需要判断
        if ([self respondsToSelector:@selector(ignoredNames)]) {
            
            if( [[self ignoredNames] containsObject:key]) continue;
        }
        
        
        //获得key对应的值
        id value = [decoder decodeObjectForKey:key];
        //设置到成员变量上 ， 每一个都要赋值
        [self setValue:value forKeyPath:key]; //相当于 self.age = [decoder decodeIntForKey:@"age"];
    }
     free(ivars);
    
}

@end
