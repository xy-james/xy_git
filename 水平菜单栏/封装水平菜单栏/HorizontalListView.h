//
//  HorizontalListView.h
//  封装水平菜单栏
//
//  Created by NYKJ on 17/3/24.
//  Copyright © 2017年 NYKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontaMeunDelegate <NSObject>

- (void)getTag:(NSInteger)tag;

@end


@interface HorizontalListView : UIView

@property (nonatomic, strong) NSArray * array;

- (void)setNameWithArray:(NSArray *)menuArray;

@property (nonatomic, weak) id <HorizontaMeunDelegate> myDelegate;

@end
