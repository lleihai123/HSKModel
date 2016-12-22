//
//  BaseModel.h
//  HSKModel-master
//
//  Created by scott on 2016/12/20.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface BaseModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic ) Person *person;
@end
