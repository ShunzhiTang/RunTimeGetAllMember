//
//  encode.h
//  RunTimeGetAllMember
//
//  Created by mac on 15-10-3.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#ifndef RunTimeGetAllMember_encode_h
#define RunTimeGetAllMember_encode_h


#define decodeAndEncode \
- (id)initWithCoder:(NSCoder *)decoder\
{ \
if (self = [super init]) {\
    [self decoder:decoder];\
    }\
    return self;\
    }\
\
- (void)encodeWithCoder:(NSCoder *)encoder\
{ \
    [self encoder:encoder];\
}
#endif
