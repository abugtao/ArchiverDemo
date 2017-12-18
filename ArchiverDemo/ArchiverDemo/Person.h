//
//  Person.h
//  归档
//
//  Created by 张海涛 on 16/5/19.
//  Copyright © 2016年 张海涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) int age;
@property (strong,nonatomic) NSArray * scores;
@property (strong,nonatomic) NSDictionary * mydic;
@end
