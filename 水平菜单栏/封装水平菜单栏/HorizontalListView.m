//
//  HorizontalListView.m
//  封装水平菜单栏
//
//  Created by NYKJ on 17/3/24.
//  Copyright © 2017年 NYKJ. All rights reserved.
//

#import "HorizontalListView.h"

@implementation HorizontalListView

- (void)setNameWithArray:(NSArray *)menuArray {
    
    _array = menuArray;
    
    //间隔
    CGFloat space = (self.frame.size.width)/_array.count;
    for (int i = 0; i<menuArray.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(space*i, 0, space, self.frame.size.height);
        btn.tag = i;
        if (btn.tag == 0) {
            btn.enabled = NO;
        }
        
        //设置按钮字体大小
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [btn setTitle:_array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        //分割线
        if (i>0 && self.frame.size.height>16) {
            UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(space*i, 8, 1, self.frame.size.height - 16)];
            lineView.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:lineView];
        }
    }
    //选中线
    UIView * makeLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 2, space, 2)];
    makeLine.backgroundColor = [UIColor redColor];
    makeLine.tag = 999;
    [self addSubview:makeLine];
    
}


- (void)btnClick:(UIButton *)sender {
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton * subBtn = (UIButton *)subView;
            if (subBtn.tag == sender.tag) {
                [subBtn setEnabled:NO];
            }else {
                [subBtn setEnabled:YES];
            }
        }
    }
    
    //计算每个按钮间隔
    CGFloat space = (self.frame.size.width)/_array.count;
    UIView * maekView = [self viewWithTag:999];
    [UIView animateWithDuration:(0.2f) animations:^{
        CGRect markFrame = maekView.frame;
        markFrame.origin.x = sender.tag * space;
        maekView.frame = markFrame;
    }];
    
    if ([self.myDelegate respondsToSelector:@selector(getTag:)]) {
        [self.myDelegate getTag:sender.tag];
    }
}

@end
