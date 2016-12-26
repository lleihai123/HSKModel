//
//  ViewController3.m
//  HSKModel-master
//
//  Created by scott on 2016/12/20.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import "ViewController3.h"
#import "BaseModel.h"
#import "NSObject+HSKModel.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"模型转字典";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *json = @{
                           @"desciption":@"集runtime之灵气, 吸MJExtension YYModel之精华",
                           @"id":@"8888888",
                           @"newName":@"zhouqiao",
                           @"hsk":[NSNull null],
                           @"person": @{
                                   @"name" : @"zhouqiao",
                                   @"age" : @"26",
                                   @"sex" : @"男"
                                   },
                           @"dic": @{
                                   @"name" : @"zhouqiao",
                                   @"age" : @"26",
                                   @"sex" : @"男",
                                   @"dic1": @{
                                           @"name" : @"zhouqiao",
                                           @"age" : @"26",
                                           @"sex" : @"男"
                                           }
                                   }
                           };
    
    
    BaseModel *model = [BaseModel hsk_modelWithObject:json];
    NSDictionary *d = [model hsk_modelToDictionary];
    NSLog(@"%@", d);

    
}

- (void)dealloc{
    
    
}



@end
