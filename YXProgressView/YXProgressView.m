//
//  YXProgressView.m
//  MyDemo
//
//  Created by 尹啟星 on 16/4/26.
//  Copyright © 2016年 yinqixing. All rights reserved.
//
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define grayColor  RGBColor(138, 138, 138)
#import "YXProgressView.h"
#import "FaceView.h"
@interface YXProgressView ()

@property (nonatomic,assign) CGFloat rectRadius;
@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic,assign) CGFloat myFaceViewInset;
@property (nonatomic,strong) CAShapeLayer *progressLayer;
@property (nonatomic,strong) CAShapeLayer *outLayer;
@property (nonatomic,strong) FaceView *myFaceView;
@property (nonatomic,strong) NSTimer  *animatedTimer;
@property (nonatomic,assign) NSTimeInterval timeInterval;
@end
@implementation YXProgressView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor      = [UIColor clearColor];
        self.isAnimated           = YES;
        self.actionLineColor      = [UIColor whiteColor];
        self.fixedLineColor       =  grayColor;
        
        CGFloat width             = frame.size.width;
        self.myFaceViewInset      = width * 0.15;
        self.rectRadius           = width * 0.2;
        self.lineWidth            = 3.0;
        self.timeInterval         = 2.0;
        
        self.myFaceView           = [FaceView new];
        self.myFaceView.faceColor = self.fixedLineColor;
        [self addSubview:self.myFaceView];
        
        self.outLayer             = [CAShapeLayer layer];
        UIBezierPath *path        = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.rectRadius];
        self.outLayer.strokeColor = self.fixedLineColor.CGColor;
        self.outLayer.lineWidth   = _lineWidth;
        self.outLayer.fillColor   =  [UIColor clearColor].CGColor;
        self.outLayer.lineCap     = kCALineCapRound;
        self.outLayer.path        = path.CGPath;
        [self.layer addSublayer:self.outLayer];
        
        self.progressLayer        = [CAShapeLayer layer];
        self.progressLayer.frame  = self.bounds;
        self.progressLayer.fillColor   = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = self.actionLineColor.CGColor;
        self.progressLayer.lineWidth   = _lineWidth;
        self.progressLayer.lineCap     = kCALineCapRound;
        self.progressLayer.path        = path.CGPath;
        [self.layer addSublayer:_progressLayer];
        
        self.progress                  = 0;
        
       
    }
    return self;
}
- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (self.isAnimated) {
        _animatedTimer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(animation) userInfo:nil repeats:YES];
        [_animatedTimer fire];
        [[NSRunLoop mainRunLoop] addTimer:_animatedTimer forMode:NSRunLoopCommonModes];
    }
    
}
- (void)removeFromSuperview{
    [super removeFromSuperview];
    [self.animatedTimer invalidate];
    self.animatedTimer = nil;
}

- (void)animation{
    __weak typeof(self) weakSelf = self;
    CGRect tempF = weakSelf.myFaceView.frame;
    tempF.origin.y = 2 * _myFaceViewInset - _myFaceViewInset * 0.5;
    [UIView animateWithDuration:weakSelf.timeInterval * 0.5 animations:^{
       
        weakSelf.myFaceView.frame = tempF;
    } completion:^(BOOL finished) {
        CGRect tempF_= weakSelf.myFaceView.frame;
        tempF_.origin.y = weakSelf.myFaceViewInset * 0.5;
        [UIView animateWithDuration:weakSelf.timeInterval * 0.5 animations:^{
            weakSelf.myFaceView.frame = tempF_;
        }];
        
        
    }];
}
- (void)setActionLineColor:(UIColor *)actionLineColor{
    _actionLineColor = actionLineColor;
    self.progressLayer.strokeColor = self.actionLineColor.CGColor;
}
- (void)setFixedLineColor:(UIColor *)fixedLineColor{
    _fixedLineColor = fixedLineColor;
    self.outLayer.strokeColor = self.fixedLineColor.CGColor;
}
- (void)setProgress:(CGFloat)progress{
    if (progress<0) {
        progress = 0;
    }
    if (progress>1) {
        progress = 1;
    }
    _progress = progress;
    self.progressLayer.strokeEnd = progress;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _myFaceView.frame = CGRectInset(self.bounds, _myFaceViewInset, _myFaceViewInset);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
