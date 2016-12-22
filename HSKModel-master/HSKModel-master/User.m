//
//  User.m
//  HSKModel-master
//
//  Created by scott on 2016/12/20.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import "User.h"

@implementation User

+ (NSDictionary *)hsk_modelClassInArray{
    return @{
             @"persons" : [Person class]
             };
}

+ (NSDictionary *)hsk_replacedKeyFromPropertyName{
    return @{
             @"ID" : @"id",
             @"desc" : @"desciption",
             @"name" : @"newName"
             };
}

+ (void)hsk_objectToModelDidFinish{
    
    NSLog(@"转换完毕");
}


@end
