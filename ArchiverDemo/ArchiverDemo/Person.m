//
//  Person.m
//  归档
//
//  Created by 张海涛 on 16/5/19.
//  Copyright © 2016年 张海涛. All rights reserved.
//


//归档 解归档必须实现<NSCoding>协议的协议方法
#import "Person.h"
#import <objc/runtime.h>
#import "EncoderDecoder.h"
@implementation Person

//这种方式当对象类的属性比较多的时候就不方便了。
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
    [aCoder encodeObject:_scores forKey:@"scores"];
    [aCoder encodeObject:_mydic forKey:@"mydic"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self  = [self init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
        self.scores = [aDecoder decodeObjectForKey:@"scores"];
        self.mydic = [aDecoder decodeObjectForKey:@"mydic"];
    }
    return self;

}


//这种方式比较适合比较多的属性  当属性比价多的时候。  运用runtime进行归档和解归档
//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    unsigned int count = 0;
//    //动态获取属性数组
//    Ivar *ivars = class_copyIvarList([Person class], &count);
//    for (int i = 0; i<count; i++) {
//        Ivar ivar = ivars[i];
//        //获取属性名称
//        const char *name = ivar_getName(ivar);
//        NSString *key = [NSString stringWithUTF8String:name];
//        //归档
//        id value = [self valueForKey:key];
//        [aCoder encodeObject:value forKey:key];
//
//    }
//    free(ivars);
//}
//
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super init]) {
//        unsigned int count = 0;
//
//        Ivar *ivars = class_copyIvarList([Person class], &count);
//        for (int i = 0; i<count; i++) {
//            Ivar ivar = ivars[i];
//            //获取属性名称
//            const char *name = ivar_getName(ivar);
//            NSString *key = [NSString stringWithUTF8String:name];
//
//            //解归档
//            id value = [aDecoder decodeObjectForKey:key];
//            [self setValue:value forKey:key];
//        }
//        free(ivars);
//    }
//    return self;
//}



//使用runtime的时候，代码基本上一直，可以写一个两个宏
//encodeRuntime(Person)
//initCoderRuntime(Person)
@end
