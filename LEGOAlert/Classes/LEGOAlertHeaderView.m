//
//  LEGOAlertHeaderView.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlertHeaderView.h"
#import <Masonry/Masonry.h>
static const CGFloat kLineWidth  = 1.0;
@interface LEGOAlertHeaderView()
@property(nonatomic , assign)BOOL showLine;
@end
@implementation LEGOAlertHeaderView
- (instancetype)initWithImage:(UIImage *)image{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _showLine = NO;
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}
- (instancetype)init{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _showLine = NO;
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.height.mas_equalTo(0);
        }];
    }
    return self;
}
- (instancetype)initWithTitle:(NSString *)title
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _showLine = YES;
        self.backgroundColor = [UIColor whiteColor];

        //正常文本标签
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor colorWithRed:253/255.0 green:125/255.0 blue:0/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:16];
        label.text = title;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.height.equalTo(@47);
        }];


    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
}
- (void)drawRect:(CGRect)rect {
    if (_showLine) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, kLineWidth);  //线宽
        CGContextSetAllowsAntialiasing(context, false);
        CGContextSetRGBStrokeColor(context, 241 / 255.0, 241 / 255.0, 241 / 255.0, 1.0);  //线的颜色
        CGContextBeginPath(context);
        
        CGContextMoveToPoint(context, 30, rect.size.height-kLineWidth);  //起点坐标
        CGContextAddLineToPoint(context, rect.size.width-30, rect.size.height-kLineWidth);   //终点坐标
        
        CGContextStrokePath(context);
    }

}
@end
