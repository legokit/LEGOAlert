//
//  LEGOAlertFooterView.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlertFooterView.h"
#import <Masonry/Masonry.h>
static const CGFloat kLineWidth  = 1.0;
@implementation LEGOAlertFooterView
- (instancetype)initWithButtons:(NSArray<NSString *> *)buttons
{
    self = [super init];
    if (self) {
        if (!buttons || buttons.count == 0) {
            return self;
        }
        self.backgroundColor = [UIColor whiteColor];
        __block  NSMutableArray *array = [NSMutableArray new];
        [buttons enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = idx;
            [button setTitle:obj forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            //最后一个按钮是默认状态
            if (idx == buttons.count-1) {
                [button setTitleColor:[UIColor colorWithRed:253/255.0 green:125/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
            }
            else{
                [button setTitleColor:[UIColor colorWithRed:69/255.0 green:69/255.0 blue:69/255.0 alpha:1.0] forState:UIControlStateNormal];
            }
            [array addObject:button];
            [self addSubview:button];

        }];
        if (array.count == 1) {
            //如果只有一个按钮
            [array.firstObject mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
                
            }];
        }
        else{
            [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                               withFixedSpacing:10
                                    leadSpacing:10
                                    tailSpacing:10];
            [array mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.bottom.equalTo(self);
            }];
        }
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, kLineWidth);  //线宽
    CGContextSetAllowsAntialiasing(context, false
                                   );
    CGContextSetRGBStrokeColor(context, 217 / 255.0, 217 / 255.0, 217 / 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0);  //起点坐标
    CGContextAddLineToPoint(context, rect.size.width, 0);   //终点坐标
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 255 / 255.0, 255 / 255.0, 255 / 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, kLineWidth);  //起点坐标
    CGContextAddLineToPoint(context, rect.size.width, kLineWidth);   //终点坐标
    CGContextStrokePath(context);
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    //渐变的背景色
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:249.209/255 green:249.636/255 blue:250.9/255 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:241.0/255 green:242.0/255 blue:245.0/255 alpha:1.0].CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    CGRect rect = self.bounds;
    rect.origin.y += kLineWidth;
    gradientLayer.frame = rect;
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    //两个按钮以上才需要分割线
    if (self.subviews.count >= 2) {
        __weak typeof(self) weakSelf = self;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //分割线渐变
            CAGradientLayer *spaceLayer = [CAGradientLayer layer];
            spaceLayer.colors = @[(__bridge id)[UIColor colorWithRed:250/255.0 green:250/255.0 blue:251/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:0.9].CGColor,(__bridge id)[UIColor colorWithRed:241/255.0 green:242/255.0 blue:245/255.0 alpha:1.0].CGColor];
            spaceLayer.locations = @[@0.0,@0.5,@1.0];
            spaceLayer.startPoint = CGPointMake(0, 0.1);
            spaceLayer.endPoint = CGPointMake(0, 0.9);
            spaceLayer.frame = CGRectMake((weakSelf.bounds.size.width/weakSelf.subviews.count)*(idx+1), 0, kLineWidth, weakSelf.bounds.size.height);
            [gradientLayer insertSublayer:spaceLayer atIndex:0];
        
        }];
        
    }

}
- (void)buttonClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(LEGOAlertFooterViewDidClickButtonAt:forAlertFooterView:)]) {
        [self.delegate LEGOAlertFooterViewDidClickButtonAt:button.tag forAlertFooterView:self];
    }
}
@end
