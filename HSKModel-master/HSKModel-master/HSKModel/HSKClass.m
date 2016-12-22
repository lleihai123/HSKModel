//
//  HSKClass.m
//
//  Created by zhouqiao on 2016/12/19.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import "HSKClass.h"
#import "NSObject+HSKModel.h"

@implementation HSKProperty

- (instancetype)initWithProperty:(objc_property_t)property{
    if(self = [super init]){
        _property = property;
        const char *propertyName = property_getName(property);
        const char *value = property_copyAttributeValue(property, "T");
        _propertyName = [NSString stringWithUTF8String:propertyName];
        _setter = NSSelectorFromString([NSString stringWithFormat:@"set%@%@:", [_propertyName substringToIndex:1].uppercaseString, [_propertyName substringFromIndex:1]]);
        _getter = NSSelectorFromString(_propertyName);
        _dataType = [self dataTypeForAttributeValue:value];
    }
    return self;
}

- (HSKDataType)dataTypeForAttributeValue:(const char *)attributeValue {
    switch (attributeValue[0]) {
        case 'B': return HSKDataTypeBool;
        case 'f': return HSKDataTypeFloat;
        case 'd': return HSKDataTypeDouble;
        case 'c': return HSKDataTypeChar;
        case 's': return HSKDataTypeShort;
        case 'i': return HSKDataTypeInt;
        case 'q': return HSKDataTypeLongLong;
        case 'C': return HSKDataTypeUnsignedChar;
        case 'S': return HSKDataTypeUnsignedShort;
        case 'I': return HSKDataTypeUnsignedInt;
        case 'Q': return HSKDataTypeUnsignedLongLong;
        case '@': {
            NSString *propertyClass = [[NSString stringWithUTF8String:attributeValue] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];
            _propertyClass = NSClassFromString(propertyClass);
            if([_propertyClass isSubclassOfClass:[NSNumber class]])              return HSKDataTypeNSNumber;
            if([_propertyClass isSubclassOfClass:[NSMutableString class]])       return HSKDataTypeNSMutableString;
            if([_propertyClass isSubclassOfClass:[NSString class]])              return HSKDataTypeNSString;
            if([_propertyClass isSubclassOfClass:[NSMutableArray class]])        return HSKDataTypeNSMutableArray;
            if([_propertyClass isSubclassOfClass:[NSArray class]])               return HSKDataTypeNSArray;
            if([_propertyClass isSubclassOfClass:[NSMutableDictionary class]])   return HSKDataTypeNSMutableDictionary;
            if([_propertyClass isSubclassOfClass:[NSDictionary class]])          return HSKDataTypeNSDictionary;
            if(![propertyClass hasPrefix:@"NS"])                                 return HSKDataTypeCustomObject;
            return HSKDataTypeOther;
        }
        default: return HSKDataTypeOther;
    }
    return HSKDataTypeOther;
}
@end

@implementation HSKClass

- (instancetype)initWithClass:(Class)cls {
    self = [super init];
    if(self){
        _cls = cls;
        
        if([cls respondsToSelector:@selector(hsk_modelClassInArray)]){
            _modelClassInArray = [cls hsk_modelClassInArray];
        }
        
        if([cls respondsToSelector:@selector(hsk_replacedKeyFromPropertyName)]){
            _replacedKeyFromPropertyName = [cls hsk_replacedKeyFromPropertyName];
        }
    
        NSMutableArray *propertys = [NSMutableArray array];
        while (cls != [NSObject class]) {
            [propertys addObjectsFromArray:[self propertysForClass:cls]];
            cls = class_getSuperclass(cls);
        }
        _propertys = propertys.copy;
    }
    return self;
}

+ (instancetype)classInfoWithClass:(Class)cls {
    static CFMutableDictionaryRef classCache;
    static dispatch_semaphore_t semaphore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        semaphore = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    HSKClass *hsk = CFDictionaryGetValue(classCache, (__bridge const void *)(cls));
    dispatch_semaphore_signal(semaphore);
    if (!hsk) {
        hsk = [[HSKClass alloc]initWithClass:cls];
        if (hsk) {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            CFDictionarySetValue(classCache, (__bridge const void *)(cls), (__bridge const void *)(hsk));
            dispatch_semaphore_signal(semaphore);
        }
    }
    return hsk;
}

- (NSArray *)propertysForClass:(Class)cls{
    NSMutableArray *propertys = [NSMutableArray array];
    unsigned int propertyCount = 0;
    objc_property_t * propertyList = class_copyPropertyList(cls, &propertyCount);
    for (int i = 0 ; i < propertyCount; i++) {
        objc_property_t property = propertyList[i];
        HSKProperty *p = [[HSKProperty alloc]initWithProperty:property];
        [propertys addObject:p];
    }
    free(propertyList);
    return propertys;
}

@end
