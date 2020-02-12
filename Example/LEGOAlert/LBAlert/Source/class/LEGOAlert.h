//
//  LEGOAlert.h
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LEGOAlertInputTextView.h"
#import "LEGOAlertInputTextField.h"
#import "LEGOAlertMessage.h"
#import "LEGOAlertView.h"
#import "LEGOAlertMainView.h"
#import "LEGOAlertHeaderView.h"
#import "LEGOAlertCloseButton.h"
#import "LEGOAlertFooterView.h"

@class LEGOAlertInputTextView,LEGOAlertInputTextField,LEGOAlertView,LEGOAlertMessage,LEGOAlertMainView,LEGOAlertHeaderView,LEGOAlertFooterView,LEGOAlertCloseButton;

//回调
typedef void(^completedHander)(NSInteger answer);
typedef void(^inputTextViewCompleteHander)(LEGOAlertInputTextView *input , NSInteger answer);
typedef void(^inputTextFieldCompleteHander)(LEGOAlertInputTextField *input , NSInteger answer);


@interface LEGOAlert : NSObject

//-----------------------普通文本提示框-----------------------------//
+ (void)say:(NSString *)message;
+ (void)say:(completedHander)block message:(NSString *)message;
+ (void)say:(completedHander)block title:(NSString *)title message:(NSString *)message;

//-----------------------普通文本询问框-----------------------------//
+ (void)ask:(completedHander)block message:(NSString *)message buttons:(NSArray<NSString *> *)buttons;
+ (void)ask:(completedHander)block title:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons;
+ (void)ask:(completedHander)block title:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons hasCloseButton:(BOOL)hasCloseButton;

//-----------------------富文本提示框-----------------------------//
+ (void)showWithMessage:(NSAttributedString *)message;
+ (void)showWithTitle:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage;
+ (void)show:(completedHander)block title:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage;
+ (void)show:(completedHander)block title:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage buttons:(NSArray<NSString *> *)buttons;
+ (void)show:(completedHander)block title:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage buttons:(NSArray<NSString *> *)buttons hasCloseButton:(BOOL)hasCloseButton;

//-----------------------图片信息提示框-----------------------------//
+ (void)showImageWith:(UIImage *)image message:(NSString *)message;
+ (void)showImageWith:(UIImage *)image title:(NSString *)title message:(NSString *)message;
+ (void)showImageWith:(UIImage *)image title:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons;
+ (void)showImageWith:(UIImage *)image title:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons block:(completedHander)block;

//-----------------------自定义视图的提示框-----------------------------//
+ (void)showCustom:(UIView *)custom;
+ (void)showCustom:(UIView *)custom title:(NSString *)title;
+ (void)showCustom:(UIView *)custom buttons:(NSArray<NSString *> *)buttons;
+ (void)showCustom:(UIView *)custom title:(NSString *)title buttons:(NSArray<NSString *> *)buttons;
+ (void)showCustom:(UIView *)custom title:(NSString *)title buttons:(NSArray<NSString *> *)buttons block:(completedHander)block hasCloseButton:(BOOL)hasCloseButton;

//-----------------------输入视图TextField的提示框-----------------------------//
+ (LEGOAlertInputTextField *)showInputTextFieldWithMessage:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextFieldCompleteHander)block;
+ (LEGOAlertInputTextField *)showInputTextFieldWithTitle:(NSString *)title message:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextFieldCompleteHander)block;
+ (LEGOAlertInputTextField *)showInputTextFieldWithTitle:(NSString *)title message:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextFieldCompleteHander)block hasCloseButton:(BOOL)hasCloseButton;

//-----------------------输入视图TextView的提示框-----------------------------//
+ (void)showInputTextViewWithMessage:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextViewCompleteHander)block;
+ (void)showInputTextViewWithTitle:(NSString *)title message:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextViewCompleteHander)block;
+ (void)showInputTextViewWithTitle:(NSString *)title message:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextViewCompleteHander)block hasCloseButton:(BOOL)hasCloseButton;


@end
