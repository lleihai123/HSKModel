//
//  HSKClass.h
//
//  Created by zhouqiao on 2016/12/19.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

typedef NS_ENUM (NSUInteger, HSKDataType) {
    HSKDataTypeBool,
    HSKDataTypeFloat,
    HSKDataTypeDouble,
    HSKDataTypeChar,
    HSKDataTypeShort,
    HSKDataTypeInt,
    HSKDataTypeLongLong,
    HSKDataTypeUnsignedChar,
    HSKDataTypeUnsignedShort,
    HSKDataTypeUnsignedInt,
    HSKDataTypeUnsignedLongLong,
    HSKDataTypeNSNumber,
    HSKDataTypeNSString,
    HSKDataTypeNSMutableString,
    HSKDataTypeNSArray,
    HSKDataTypeNSMutableArray,
    HSKDataTypeNSDictionary,
    HSKDataTypeNSMutableDictionary,
    HSKDataTypeCustomObject,
    HSKDataTypeOther
};

@interface HSKProperty : NSObject

- (instancetype)initWithProperty:(objc_property_t)property;
@property (nonatomic, assign, readonly) objc_property_t property;
@property (nonatomic, assign, readonly) HSKDataType dataType;
@property (nonatomic, assign, readonly) Class propertyClass;
@property (nonatomic, assign, readonly) SEL setter;
@property (nonatomic, assign, readonly) SEL getter;
@property (nonatomic, assign, readonly) NSString *propertyName;
@end

@interface HSKClass : NSObject

+ (instancetype)classInfoWithClass:(Class)cls;
@property (nonatomic, assign, readonly) Class cls;
@property (nonatomic, strong, readonly) NSArray<HSKProperty *> *propertys;
@property (nonatomic, strong, readonly) NSDictionary<NSString *, Class> *modelClassInArray;
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSString *> *replacedKeyFromPropertyName;

@end
