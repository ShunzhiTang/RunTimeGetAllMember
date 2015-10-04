//
//  ViewController.m
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取student类的成员属性的信息
    [self getMember];
    
    
    
}

//点击屏幕的时间进行归档存储操作
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    Student *stu = [[Student alloc]init];
    
    stu.name = @"zs";
    stu.age = 19;
    stu.height = 1.88;
    //Archiver 把。。。存档 ，就是归档
    [NSKeyedArchiver archiveRootObject:stu toFile:@"/Users/mac/Desktop/student.data"];

}



- (void)getMember{
    
    //用来存储成员变量的数量
    unsigned int count = 0;
    //获得Dog类的所有成员变量
    Ivar *ivars = class_copyIvarList([Student class], &count);
    //这句话就是把count已经存储好了 ，count就是Student类中的成员属性的数量
    
    NSLog(@"%zd",count);
    //遍历所有的成员变量
    for (int i = 0; i < count; ++i) {
        //取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        //获取 成员属性的名称和类型
        const char *name = ivar_getName(ivar);
        
        const char *type = ivar_getTypeEncoding(ivar);
        
        NSLog(@"%s  %s" , name , type);
    }

}
@end
