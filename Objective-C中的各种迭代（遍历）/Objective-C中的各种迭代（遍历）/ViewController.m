//
//  ViewController.m
//  Objective-C中的各种迭代（遍历）
//
//  Created by 文顶顶 on 16/3/7.
//  Copyright © 2016年 文顶顶. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark --------------------
#pragma mark Events
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self iteratorWithApply];
}

#pragma mark --------------------
#pragma mark Methods
//普通的for循环遍历
-(void)iteratorWithFor
{
    //////////处理数组//////////
    NSArray *arrayM = @[@"1",@"2",@"3",@"4"];
    NSInteger arrayMCount = [arrayM count];
    for (int i = 0; i<arrayMCount; i++) {
        NSString *obj = arrayM[i];
        NSLog(@"%@",obj);
    }

    //////////处理字典//////////
    NSDictionary *dictM = @{@"1":@"one",@"2":@"two",@"3":@"three"};
    NSArray *dictKeysArray = [dictM allKeys];
    for (int i = 0; i<dictKeysArray.count; i++) {
        NSString *key = dictKeysArray[i];
        NSString *obj = [dictM objectForKey:key];
        NSLog(@"%@:%@",key,obj);
    }

    //////////处理集合//////////
    NSSet * setM = [[NSSet alloc] initWithObjects:@"one",@"two",@"three",@"four", nil];
    NSArray *setObjArray = [setM allObjects];
    for (int i = 0; i<setObjArray.count; i++) {
        NSString *obj = setObjArray[i];
        NSLog(@"%@",obj);
    }

    //////////反向遍历----降序遍历----以数组为例
    NSArray *arrayM2 = @[@"1",@"2",@"3",@"4"];
    NSInteger arrayMCount2 = [arrayM2 count] - 1;

    for (NSInteger i = arrayMCount2; i>0; i--) {
        NSString *obj = arrayM2[i];
        NSLog(@"%@",obj);
    }
}

//使用NSEnumerator遍历
-(void)iteratorWithEnumerator
{
    //////////处理数组//////////
    NSArray *arrayM = @[@"1",@"2",@"3",@"4"];
    NSEnumerator *arrayEnumerator = [arrayM objectEnumerator];
    NSString *obj;
    while ((obj = [arrayEnumerator nextObject]) != nil) {
        NSLog(@"%@",obj);
    }

    //////////处理字典//////////
    NSDictionary *dictM = @{@"1":@"one",@"2":@"two",@"3":@"three"};
    NSEnumerator *dictEnumerator = [dictM keyEnumerator];
    NSString *key;
    while ((key = [dictEnumerator nextObject]) != nil) {
        NSString *obj = dictM[key];
        NSLog(@"%@",obj);
    }


    //////////处理集合//////////
    NSSet * setM = [[NSSet alloc] initWithObjects:@"one",@"two",@"three",@"four", nil];
    NSEnumerator *setEnumerator = [setM objectEnumerator];
    NSString *setObj;
    while ((setObj = [setEnumerator nextObject]) != nil) {
        NSLog(@"%@",setObj);
    }


    //////////反向遍历----降序遍历----以数组为例
    NSArray *arrayM2 = @[@"1",@"2",@"3",@"4"];
    NSEnumerator *arrayEnumerator2 = [arrayM2 reverseObjectEnumerator];
    NSString *obj2;
    while ((obj2 = [arrayEnumerator2 nextObject]) != nil) {
        NSLog(@"%@",obj2);
    }

}

//使用for...In进行快速遍历
-(void)iteratorWithForIn
{
    //////////处理数组//////////
    NSArray *arrayM = @[@"1",@"2",@"3",@"4"];
    for (id obj in arrayM) {
        NSLog(@"%@",obj);
    }

    //////////处理字典//////////
    NSDictionary *dictM = @{@"1":@"one",@"2":@"two",@"3":@"three"};
    for (id obj in dictM) {
        NSLog(@"%@",dictM[obj]);
    }

    //////////处理集合//////////
    NSSet * setM = [[NSSet alloc] initWithObjects:@"one",@"two",@"three",@"four", nil];
    for (id obj in setM) {
        NSLog(@"%@",obj);
    }

    //////////反向遍历----降序遍历----以数组为例
    NSArray *arrayM2 = @[@"1",@"2",@"3",@"4"];
    for (id obj in [arrayM2 reverseObjectEnumerator]) {
        NSLog(@"%@",obj);
    }
}

//基于块（block）的遍历方式
-(void)iteratorWithBlock
{
    //////////处理数组//////////
    NSArray *arrayM = @[@"1",@"2",@"3",@"4"];
    [arrayM enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%zd--%@",idx,obj);
    }];

    //////////处理字典//////////
    NSDictionary *dictM = @{@"1":@"one",@"2":@"two",@"3":@"three"};
    [dictM enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@:%@",key,obj);
    }];

    //////////处理集合//////////
    NSSet * setM = [[NSSet alloc] initWithObjects:@"one",@"two",@"three",@"four", nil];
    [setM enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@",obj);
    }];

    //////////反向遍历----降序遍历----以数组为例
    NSArray *arrayM2 = @[@"1",@"2",@"3",@"4"];
    [arrayM2 enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%zd--%@",idx,obj);
    }];
}

//使用GCD中的dispatch_apply函数
-(void)iteratorWithApply
{
    //////////处理数组//////////
    NSArray *arrayM = @[@"1",@"2",@"3",@"4"];

    //获得全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    dispatch_apply(arrayM.count, queue, ^(size_t index) {
        NSLog(@"%@--%@",arrayM[index],[NSThread currentThread]);
    });
}
@end
