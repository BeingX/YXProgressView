//
//  FaceView.m
//  MyDemo
//
//  Created by 尹啟星 on 16/4/26.
//  Copyright © 2016年 yinqixing. All rights reserved.
//
void drawBgInContext(CGContextRef context,CGRect rect,UIColor *color){
    CGContextAddRect(context,rect);
    [color set];
    CGContextDrawPath(context, kCGPathFillStroke);
}
#import "FaceView.h"

@implementation FaceView

- (void)drawRect:(CGRect)rect{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGContextRef context=UIGraphicsGetCurrentContext();
  
    //眼睛
    CGFloat eyeRadius = width * 0.1;
    CGFloat factor_eyeX = 0.3;
    CGFloat factor_eyeY = 0.2;
    CGPoint leftEyeCenter = CGPointMake(width * factor_eyeX, height * factor_eyeY);
    CGPoint RightEyeCenter = CGPointMake(width - width * factor_eyeX, height * factor_eyeY);
    CGContextAddArc(context, leftEyeCenter.x, leftEyeCenter.y, eyeRadius, 0, M_PI * 2, 0);
    CGContextAddArc(context, RightEyeCenter.x, RightEyeCenter.y, eyeRadius, 0, M_PI * 2, 0);
    
    if (_faceColor) {
        [_faceColor set];
    }
    
    CGContextDrawPath(context, kCGPathFill);
    //嘴
    CGFloat factor_pX = 0.15;
    CGFloat factor_pY = 0.6;
    
    CGFloat factor_cX = 0.5;
    CGFloat factor_cY = 0.8;
    
    CGPoint startPoint = CGPointMake(width * factor_pX, height * factor_pY);
    CGPoint endPoint = CGPointMake(width - width * factor_pX, height * factor_pY);
    CGPoint controlPoint = CGPointMake(width * factor_cX, height * factor_cY);
    //贝塞尔曲线
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddQuadCurveToPoint(context, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y);
    CGContextSetLineWidth(context, 2.0);
    CGContextDrawPath(context, kCGPathStroke);

}
- (void)setFaceColor:(UIColor *)faceColor{
    _faceColor = faceColor;
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
