//
//  Student.m
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student
/**
 *从文档中读取对象时会调用这个方法（开发者需要在这个方法中说明那些属性需要取出来）
 */
- (id)initWithCoder:(NSCoder *)decoder{ //解档
    if (self = [super init]) {
        
        
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
            
            //获得key对应的值
            id value = [decoder decodeObjectForKey:key];
            //设置到成员变量上 ， 每一个都要赋值
            [self setValue:value forKeyPath:key]; //相当于 self.age = [decoder decodeIntForKey:@"age"];
    }
    
    }
    return self;
}
/**
 *  将对象写入文件时会调用这个方法（开发者需要在这个方法中说明存储那些属性）
 */

- (void)encodeWithCoder:(NSCoder *)encoder{ //归档
    
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
        
        NSLog(@"%@",key); //name  age 。。。
        
        //通过key获得对应成员变量的值
        id  value = [self valueForKeyPath:key]; //我们设置的值
        
        //进行归档 ，在根据我们设置的  值 ： 属性  进行存储  一样。。
        [encoder encodeObject:value forKey:key];
    }
    
}

/**
 * 当出现很多的成员属性 ，我们进行归档或者解档， 在或者进行字典转模型的时间就会非常的麻烦 ，我们就需要使用获取类的所有的属性进行kvc就可以了
*/
@end
