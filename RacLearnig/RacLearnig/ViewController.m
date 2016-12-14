//
//  ViewController.m
//  RacLearnig
//
//  Created by agj on 16/12/14.
//  Copyright © 2016年 agj. All rights reserved.
//  https://kevinhm.gitbooks.io/functionalreactiveprogrammingonios/content/chapter3/map.html

#import "ViewController.h"
#import <RACCommand.h>
#import <RXCollection.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@1, @2, @3];
    NSArray *mappedArray = [array rx_mapWithBlock:^id(NSNumber *each) {
        return @(pow([each integerValue], 2));
    }];
    NSLog(@"%@", mappedArray);
    
    //  高阶过滤
    NSArray *filteredArray = [array rx_filterWithBlock:^BOOL(id each) {
        return ([each integerValue] % 2 == 0);
    }];
    NSLog(@"%@", filteredArray);
    
    //  高阶折叠
    //    Fold 是一个有趣的高阶函数 - 她把列表中所有的元素变成一个值. 一个简单的高阶折叠能够用来给数值数组求和
    NSNumber *sum = [array rx_foldWithBlock:^id(id memo, id each) {
        return @([memo integerValue] + [each integerValue]);
    }];
    NSLog(@"%@", sum);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
