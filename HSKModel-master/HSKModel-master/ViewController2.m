//
//  ViewController2.m
//  HSKModel-master
//
//  Created by scott on 2016/12/20.
//  Copyright © 2016年 ZQ. All rights reserved.
//

#import "ViewController2.h"
#import "Person.h"
#import "User.h"
#import "NSObject+HSKModel.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"数组字典转模型";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *json = @[
                           @{
                               @"desciption":@"集runtime之灵气, 吸MJExtension YYModel之精华",
                               @"id":@"8888888",
                               @"newName":@"zhouqiao",
                               @"hsk":[NSNull null],
                               @"persons":@[
                                               @{
                                                   @"name" : @"zhou",
                                                   @"age" : @"26",
                                                   @"sex" : @"男"
                                               },
                                               @{
                                                   @"name" : @"zhouqiao",
                                                   @"age" : @"16",
                                                   @"sex" : @"男"
                                                },
                                               @{
                                                   @"name" : @"qiao",
                                                   @"age" : @"36",
                                                   @"sex" : @"女"
                                                }
                        
                                            ]
                              
                               },
                           @{
                               @"desciption":@"集runtime之灵气, 吸MJExtension YYModel之精华",
                               @"id":@"8888888",
                               @"newName":@"zhouqiao",
                               @"hsk":[NSNull null],
                               @"persons":@[
                                       @{
                                           @"name" : @"zhou",
                                           @"age" : @"26",
                                           @"sex" : @"男"
                                           },
                                       @{
                                           @"name" : @"zhouqiao",
                                           @"age" : @"16",
                                           @"sex" : @"男"
                                           },
                                       @{
                                           @"name" : @"qiao",
                                           @"age" : @"36",
                                           @"sex" : @"女"
                                           }
                                       
                                       ]
                               
                               },
                           @{
                               @"desciption":@"集runtime之灵气, 吸MJExtension YYModel之精华",
                               @"id":@"8888888",
                               @"newName":@"zhouqiao",
                               @"hsk":[NSNull null],
                               @"persons":@[
                                       @{
                                           @"name" : @"zhou",
                                           @"age" : @"26",
                                           @"sex" : @"男"
                                           },
                                       @{
                                           @"name" : @"zhouqiao",
                                           @"age" : @"16",
                                           @"sex" : @"男"
                                           },
                                       @{
                                           @"name" : @"qiao",
                                           @"age" : @"36",
                                           @"sex" : @"女"
                                           }
                                       
                                       ]
                               
                               },
                           ];
    
    
    NSMutableArray *models = [User hsk_modelArrayWithObject:json];
    NSLog(@"%@",models);
    
   
}

- (void)dealloc{
    
    
}

@end
