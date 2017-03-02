//
//  ViewController.m
//  SuanFa
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<100; i++) {
        NSNumber *number = [NSNumber numberWithInt:arc4random()%100];
        [array addObject:number];
    }
    NSLog(@"before buddle=%@",array);
    [self buddleArrary:array];
    NSLog(@"after  buddle=%@",array);
    
    
    NSMutableArray *zuhes = [self zuHeWithString:@"abcd"];
    NSLog(@"排列组合=%@",zuhes);
    
    
    
}

/**
 输入字符串，输出字符串中所有字符的排列组合

 @param string 字符串
 @return 数组
 */
-(NSMutableArray *)zuHeWithString:(NSString *)string
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<string.length-1; i++) {
        NSString *subString1 = [string substringWithRange:NSMakeRange(i, 1)];
        NSString *subString2 = [string substringWithRange:NSMakeRange(i+1, 1)];
        [results addObject:subString1];
        
        NSArray *tempResults = [results copy];
        for (NSString *temp in tempResults) {
            NSString *subString = [NSString stringWithFormat:@"%@%@",temp,subString2];
            [results addObject:subString];
        }
    }
    return results;
}








/**
 冒泡排序 -- 从小到大

 @param array 待排序数组
 */
-(void)buddleArrary:(NSMutableArray *)array
{
    id temp;
    for (int i = 0; i<array.count; i++)
    {
        for(int j = 0; j<array.count-i-1; j++)
        {
            if (array[j] > array[j+1]) {
                //方法1
                //[array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                
                //方法2
                temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
}
@end
