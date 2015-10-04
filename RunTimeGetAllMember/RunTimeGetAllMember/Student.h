//
//  Student.h
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <Foundation/Foundation.h>

//要实现归档 就必须去遵守协议 nsCoding
@interface Student : NSObject <NSCoding>

//属性
@property (nonatomic, assign) int age;

@property (nonatomic, assign) double height;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *sex;
@end
