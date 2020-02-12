//
//  LEGOAlertView.h
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "LEGOAlertFooterView.h"
#import "LEGOAlertMessage.h"
#import "LEGOAlertCloseButton.h"
#import "LEGOAlertHeaderView.h"
#import "LEGOAlertMainView.h"

@interface LEGOAlertView : UIViewController
//头部
@property(nonatomic , strong , readonly)LEGOAlertHeaderView *alertHeaderView;
//中心区
@property(nonatomic , strong , readonly)LEGOAlertMainView *alertMainView;
//脚部
@property(nonatomic , strong , readonly)LEGOAlertFooterView *alertFooterView;
//右上角的关闭按钮
@property(nonatomic , strong , readonly)LEGOAlertCloseButton *alertCloseButton;
//容器，替代自己用来放子视图
@property(nonatomic , strong , readonly)UIView *contentView;
//弹出框的属性
@property(nonatomic , copy , readonly)NSString *title;
@property(nonatomic , copy , readonly)UIImage *headerImage;
@property(nonatomic , copy , readonly)NSAttributedString *attributedMessage;
@property(nonatomic , strong , readonly)NSArray<NSString *> *buttons;
@property(nonatomic , copy , readonly)void(^completedHander)(NSInteger) ;
@property(nonatomic , assign , readonly)BOOL hasCloseButton;
@property(nonatomic , strong ,readonly)LEGOAlertMessage *message;

//对外接口
- (void)show;
- (void)dismiss:(void(^)(void))complete;

//提供给子类重写
- (LEGOAlertHeaderView *)alertHeaderView;
- (LEGOAlertMainView *)alertMainView;
- (LEGOAlertFooterView *)alertFooterView;
- (void)prepareDisplay;


//添加头部标题
- (instancetype)addTitle:(NSString *)title;
//添加头部图片
- (instancetype)addHeaderImage:(UIImage *)image;
//添加提示内容
- (instancetype)addMessage:(LEGOAlertMessage *)message;
//添加右上角关闭按钮
- (instancetype)addCloseButton;
//添加右上角关闭按钮(带回调)
- (instancetype)addCloseButton:(void(^)(LEGOAlertView *alertView))closeButtonHander;
//添加右上角关闭按钮的图片
- (instancetype)addCloseButtonImage:(UIImage*(^)(void))closeButtonImageSettingHander;
//添加操作按钮组
- (instancetype)addButtons:(NSArray<NSString *> *)buttons;
//添加回调
- (instancetype)addCompletedHander:(void(^)(NSInteger))completedHander;
@end
