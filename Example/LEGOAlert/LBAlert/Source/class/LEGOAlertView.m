//
//  LEGOAlertView.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlertView.h"
#import "LEGOAlert.h"
#import <Masonry/Masonry.h>
#import "LEGOAlertHeaderView.h"
#import "LEGOAlertMainView.h"
#import <UIKit/UIKit.h>
#import "FlipDismissAnimationController.h"
#import "FlipPresentAnimationController.h"
#import "UIApplication+LEGOViewController.h"

#define iPhone4or5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)||CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)) : NO)
#define kWindow [UIApplication sharedApplication].keyWindow
@interface LEGOAlertView()<LEGOAlertFooterViewDelegate,UIViewControllerTransitioningDelegate>
//头部
@property(nonatomic , strong )LEGOAlertHeaderView *alertHeaderView;
//中心区
@property(nonatomic , strong )LEGOAlertMainView *alertMainView;
//脚部
@property(nonatomic , strong )LEGOAlertFooterView *alertFooterView;
//右上角的关闭按钮
@property(nonatomic , strong )LEGOAlertCloseButton *alertCloseButton;
//容器，替代自己用来放子视图
@property(nonatomic , strong )UIView *contentView;
//半透明层
@property(nonatomic , strong )UIView *overlayView;
//过渡动画(直接拿第三方的代码修改了下过渡动画效果)
@property (strong, nonatomic) FlipPresentAnimationController *flipPresentAnimationController;
@property (strong, nonatomic) FlipDismissAnimationController *flipDismissAnimationController;

//弹出框的属性
@property(nonatomic , copy )NSString *headerTitle;
@property(nonatomic , copy )UIImage *headerImage;
@property(nonatomic , copy )NSAttributedString *attributedMessage;
@property(nonatomic , strong )NSArray<NSString *> *buttons;
@property(nonatomic , copy )completedHander completedHander;
@property(nonatomic , copy )void(^closeButtonHander)(LEGOAlertView *alertView);
@property(nonatomic , copy )UIImage*(^closeButtonImageSettingHander)(void);
@property(nonatomic , assign )BOOL hasCloseButton;
@property(nonatomic , strong )LEGOAlertMessage *message;
@end
@implementation LEGOAlertView
//添加头部标题
- (instancetype)addTitle:(NSString *)title{
    _headerTitle = title;
    return self;
}
//添加头部图片
- (instancetype)addHeaderImage:(UIImage *)image{
    _headerImage = image;
    return self;
}
//添加提示内容
- (instancetype)addMessage:(LEGOAlertMessage *)message{
    _message = message;
    return self;
}
//添加右上角关闭按钮
- (instancetype)addCloseButton{
    _hasCloseButton = YES;
    return self;
}
//添加右上角关闭按钮(带回调)
- (instancetype)addCloseButton:(void(^)(LEGOAlertView *alertView))closeButtonHander{
    _closeButtonHander = [closeButtonHander copy];
   return [self addCloseButton];
}
//设置右上角关闭按钮的图片
- (instancetype)addCloseButtonImage:(UIImage*(^)(void))closeButtonImageSettingHander{
    _closeButtonImageSettingHander = [closeButtonImageSettingHander copy];
    return self;
}
//添加操作按钮组
- (instancetype)addButtons:(NSArray<NSString *> *)buttons{
    _buttons = buttons;
    return self;
}
//添加回调
- (instancetype)addCompletedHander:(void(^)(NSInteger))completedHander{
    _completedHander = [completedHander copy];
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self layoutSubviews];
}
- (void)loadView{
    [super loadView];
}
- (void)layoutSubviews{
    
        [self.view addSubview:self.overlayView];
        [self.overlayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
            make.center.equalTo(self.view);
        }];
    
        [self.contentView addSubview:self.alertMainView];
        [self.contentView addSubview:self.alertFooterView];
        [self.contentView addSubview:self.alertHeaderView];
        [self.overlayView addSubview:self.contentView];
    
    
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.overlayView).priorityLow();
            make.width.mas_equalTo(iPhone4or5?280:323);
            make.height.lessThanOrEqualTo(self.overlayView).offset(-30);
        }];
    
        [self.alertHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.height.mas_greaterThanOrEqualTo(@47).priorityLow();
        }];
        [self.alertMainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            make.top.equalTo(self.alertHeaderView.mas_bottom);
            make.bottom.equalTo(self.alertFooterView.mas_top);
        }];
        [self.alertFooterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo( (_buttons && _buttons.count) ? @47:@0);
        }];
        //如果需要添加关闭按钮
        if (_hasCloseButton) {
            [self.overlayView addSubview:self.alertCloseButton];
            [self.alertCloseButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.alertHeaderView.mas_right).offset(-5);
                make.centerY.equalTo(self.alertHeaderView.mas_top).offset(5);
                make.size.mas_equalTo(CGSizeMake(33, 33));
            }];
        }
        [self prepareDisplay];
}
- (void)prepareDisplay{
    self.contentView.clipsToBounds = NO;
    self.contentView.layer.cornerRadius = 6.0;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
}

- (void)closeButton:(UIButton *)button{
    if (_closeButtonHander) {
        _closeButtonHander(self);
    }
    else{
        [self dismiss:nil];
    }
    
}

- (void)show{
    self.flipPresentAnimationController = [[FlipPresentAnimationController alloc] init];
    self.flipDismissAnimationController = [[FlipDismissAnimationController alloc] init];
    
    [self setTransitioningDelegate:self];
    self.modalPresentationStyle = UIModalPresentationCustom;
    //弹出框控制器不要覆盖原来的状态栏
    [self setModalPresentationCapturesStatusBarAppearance:NO];
    [[UIApplication getPresentedViewController] presentViewController:self animated:YES completion:^{
    }];
    
    
}
- (void)dismiss:(void(^)())complete{
    [self dismissViewControllerAnimated:YES completion:complete];
}
#pragma mark- LEGOAlertFooterViewDelegate
- (void)LEGOAlertFooterViewDidClickButtonAt:(NSInteger)index forAlertFooterView:(LEGOAlertFooterView *)alertFooterView{
    [self dismiss:^{
        if (_completedHander) {
            _completedHander(index);
        }
    }];

}
#pragma mark- Setter|Getter
- (UIView *)overlayView{
    if (!_overlayView) {
        _overlayView = [[UIView alloc]init];
        _overlayView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        
    }
    return _overlayView;
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}
//提供给子类重写
- (LEGOAlertHeaderView *)alertHeaderView{
    if (!_alertHeaderView) {
        if (_headerTitle) {
            _alertHeaderView = [[LEGOAlertHeaderView alloc]initWithTitle:_headerTitle];
        }
        else if (_headerImage){
            _alertHeaderView = [[LEGOAlertHeaderView alloc]initWithImage:_headerImage];
        }
        else{
            _alertHeaderView = [[LEGOAlertHeaderView alloc]init];
        }
        
    }
    return _alertHeaderView;
}
- (LEGOAlertMainView *)alertMainView{
    if (!_alertMainView) {
        _alertMainView = [[LEGOAlertMainView alloc]initWithMessage:_message];
    }
    return _alertMainView;
}
- (LEGOAlertFooterView *)alertFooterView{
    if (!_alertFooterView) {
        _alertFooterView = [[LEGOAlertFooterView alloc]initWithButtons:_buttons];
        _alertFooterView.delegate = self;
    }
    return _alertFooterView;
}

- (LEGOAlertCloseButton *)alertCloseButton{
    if (!_alertCloseButton) {
        _alertCloseButton = [LEGOAlertCloseButton buttonWithType:UIButtonTypeCustom];
        
        if (_closeButtonImageSettingHander) {
            UIImage *image = _closeButtonImageSettingHander();
            [_alertCloseButton setImage:image forState:UIControlStateNormal];
        }
        else{
            [_alertCloseButton setImage:[UIImage imageNamed:@"LEGOAlert.bundle/close"] forState:UIControlStateNormal];
        }
        
        [_alertCloseButton addTarget:self action:@selector(closeButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _alertCloseButton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //注册键盘出现的通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWasShown:)
                                                     name:UIKeyboardWillShowNotification object:nil];
        //注册键盘消失的通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWilLEGOeHidden:)
                                                     name:UIKeyboardWillHideNotification object:nil];

    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWasShown:(NSNotification*)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    CGRect rect = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight   = CGRectGetHeight(rect);
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改下边距约束
    __weak typeof(self) weakSelf = self;
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        //计算弹出框底部离父视图的底部的距离
        CGFloat bottom = self.overlayView.bounds.size.height - self.contentView.frame.origin.y - self.contentView.frame.size.height;
        if ((bottom-15) < keyboardHeight) {
            //弹出框只会往以上而不会下移，体验更好些
            CGFloat h = self.contentView.bounds.size.height/2 - (self.overlayView.bounds.size.height/2 - keyboardHeight);
            make.centerY.equalTo(weakSelf.overlayView.mas_centerY).offset(-h - 15);
        }
        
        
    }];
    [UIView animateWithDuration:keyboardDuration animations:^{
        [weakSelf.overlayView layoutSubviews];
    }];

}
-(void)keyboardWilLEGOeHidden:(NSNotification*)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改下边距约束
    __weak typeof(self) weakSelf = self;
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.overlayView).offset(0);
    }];
    [UIView animateWithDuration:keyboardDuration animations:^{
        [weakSelf.overlayView layoutSubviews];
    }];



}
#pragma mark- 旋转控制，必须得限制
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations

{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
#pragma mark- 自定义过渡动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.flipPresentAnimationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.flipDismissAnimationController;
}
@end
