 //
//  NSObject+HSKModel.h
//
//  Created by zhouqiao on 2016/12/19.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@protocol HSKModel <NSObject>
@optional
+ (NSDictionary<NSString *, Class> *)hsk_modelClassInArray;
+ (NSDictionary<NSString *, NSString *> *)hsk_replacedKeyFromPropertyName;
+ (void)hsk_objectToModelDidFinish;
@end

@interface NSObject (HSKModel)

+ (instancetype)hsk_modelWithObject:(id)object;
+ (NSMutableArray *)hsk_modelArrayWithObject:(id)object;

+ (instancetype)hsk_modelWithResource:(NSString *)name ofType:(NSString *)ext;
+ (NSMutableArray *)hsk_modelArrayWithResource:(NSString *)name ofType:(NSString *)ext;

- (NSMutableDictionary *)hsk_modelToDictionary;

@end
