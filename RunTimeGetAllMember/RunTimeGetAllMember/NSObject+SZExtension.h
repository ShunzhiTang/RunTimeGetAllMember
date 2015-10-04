//
//  NSObject+SZExtension.h
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SZExtension)

- (NSArray *)ignoredNames;

//归档
- (void)encoder:(NSCoder *)encoder;

//解档
- (void)decoder:(NSCoder *)decoder;

@end
