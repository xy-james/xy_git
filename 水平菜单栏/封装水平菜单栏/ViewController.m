//
//  ViewController.m
//  封装水平菜单栏
//
//  Created by NYKJ on 17/3/24.
//  Copyright © 2017年 NYKJ. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalListView.h"

@interface ViewController () <HorizontaMeunDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"水平菜单栏";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    HorizontalListView * meunView = [[HorizontalListView alloc] init];
    meunView.frame = CGRectMake(0, 64, self.view.frame.size.width, 40);
    meunView.backgroundColor = [UIColor whiteColor];
    [meunView setNameWithArray:@[@"今日最新",@"今日推荐",@"今日头条"]];
    meunView.myDelegate = self;
    [self.view addSubview:meunView];
    
}

- (void)getTag:(NSInteger)tag {
    self.navigationItem.title = [NSString stringWithFormat:@"菜单:%ld",tag];
    NSLog(@"菜单%ld",tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
