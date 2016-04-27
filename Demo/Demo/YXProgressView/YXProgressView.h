//
//  YXProgressView.h
//  MyDemo
//
//  Created by 尹啟星 on 16/4/26.
//  Copyright © 2016年 yinqixing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXProgressView : UIView
/**
 *  用来更新进度
 */
@property (nonatomic,assign) CGFloat progress;
/**
 *  是否动画效果，默认YES。
 */
@property (nonatomic,assign) BOOL    isAnimated;
/**
 *  进度条的颜色，默认是白色
 */
@property (nonatomic,strong) UIColor *actionLineColor;
/**
 *  进度条的底色，默认是灰色
 */
@property (nonatomic,strong) UIColor *fixedLineColor;

@end
