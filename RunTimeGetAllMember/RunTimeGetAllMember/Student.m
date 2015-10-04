//
//  Student.m
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "Student.h"

@implementation Student
/**
 *从文档中读取对象时会调用这个方法（开发者需要在这个方法中说明那些属性需要取出来）
 */
- (id)initWithCoder:(NSCoder *)decoder{ //解档
    if (self = [super init]) {
        self.age = [decoder decodeIntForKey:@"age"];
        
        self.height = [decoder decodeDoubleForKey:@"height"];
        
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    NSLog(@"%s",__func__);

    return self;
}

/**
 *  将对象写入文件时会调用这个方法（开发者需要在这个方法中说明存储那些属性）
 */

- (void)encodeWithCoder:(NSCoder *)encoder{ //归档
    [encoder encodeInt:self.age forKey:@"age"];
     [encoder encodeDouble:self.height forKey:@"height"];
     [encoder encodeObject:self.name  forKey:@"name"];
    
    NSLog(@"%s",__func__);
}
@end
