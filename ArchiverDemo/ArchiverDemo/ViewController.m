//
//  ViewController.m
//  ArchiverDemo
//
//  Created by zhanghaitao on 2017/12/18.
//  Copyright © 2017年 zhanghaitao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)archiverAction:(id)sender {
    Person *p = [[Person alloc] init];
    p.name = @"涛哥";
    p.age = 26;
    p.scores = @[@"100",@"95"];
    p.mydic = @{@"name":@"zht",@"age":@26};
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"zht.data"];
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    
}


- (IBAction)unArchiverAction:(id)sender {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"zht.data"];
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"name:%@,age:%d,scroes:%@,dic:%@",p.name,p.age,p.scores,p.mydic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
