//
//  User.h
//  HSKModel-master
//
//  Created by scott on 2016/12/20.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface User : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *age;
@property (nonatomic) NSString *ID;
@property (nonatomic) NSString *desc;
@property (nonatomic) NSArray<Person *> *persons;
@end
