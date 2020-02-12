//
//  LEGOAlert.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlert.h"
#import "LEGOAlertView.h"

@implementation LEGOAlert
//-----------------------普通文本提示框-----------------------------//
+ (void)say:(NSString *)message{
    [self say:nil message:message];
}
+ (void)say:(completedHander)block message:(NSString *)message{
    [self say:block title:@"提示" message:message];
}
+ (void)say:(completedHander)block title:(NSString *)title message:(NSString *)message{
    [self ask:block title:title message:message buttons:@[@"知道了"] hasCloseButton:NO];
}

//-----------------------普通文本询问框-----------------------------//
+ (void)ask:(completedHander)block message:(NSString *)message buttons:(NSArray<NSString *> *)buttons{
    [self ask:block title:@"提示" message:message buttons:buttons hasCloseButton:NO];
}
+ (void)ask:(completedHander)block title:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons{
    [self ask:block title:title message:message buttons:buttons hasCloseButton:NO];
}
+ (void)ask:(completedHander)block title:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons hasCloseButton:(BOOL)hasCloseButton{
    //普通文本信息
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeMessage];
    msg.message = message;
    if (hasCloseButton) {
        [[[[[[[LEGOAlertView new]addTitle:title]addMessage:msg]addButtons:buttons]addCloseButton]addCompletedHander:block]show];
    }
    else{
        [[[[[[LEGOAlertView new]addTitle:title]addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
    }

}
//-----------------------富文本提示框-----------------------------//
+ (void)showWithMessage:(NSAttributedString *)attributedMessage{
    [self showWithTitle:@"提示" attributedMessage:attributedMessage];
}
+ (void)showWithTitle:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage{
    [self show:nil title:title attributedMessage:attributedMessage buttons:@[@"知道了"]];
}
+ (void)show:(completedHander)block title:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage{
    [self show:block title:title attributedMessage:attributedMessage buttons:@[@"知道了"]];
}
+ (void)show:(completedHander)block title:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage buttons:(NSArray<NSString *> *)buttons{
    [self show:block title:title attributedMessage:attributedMessage buttons:buttons hasCloseButton:NO];
}
+ (void)show:(completedHander)block title:(NSString *)title attributedMessage:(NSAttributedString *)attributedMessage buttons:(NSArray<NSString *> *)buttons hasCloseButton:(BOOL)hasCloseButton{
    //属性文本信息
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeAttributedMessage];
    msg.attributedMessage = attributedMessage;
    if (hasCloseButton) {
        [[[[[[[LEGOAlertView new]addTitle:title]addMessage:msg]addButtons:buttons]addCloseButton]addCompletedHander:block]show];
    }
    else{
        [[[[[[LEGOAlertView new]addTitle:title]addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
    }
}
//-----------------------成功失败提示框-----------------------------//
+ (void)showSuccessWithMessage:(NSString *)message{
    [self showSuccessWithTitle:@"提示" message:message];
}
+ (void)showSuccessWithTitle:(NSString *)title message:(NSString *)message{
    [self showSuccessWithTitle:title message:message buttons:@[@"知道了"]];
}
+ (void)showSuccessWithTitle:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons{
    [self showSuccessWithTitle:title message:message buttons:buttons block:nil];
}
+ (void)showSuccessWithTitle:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons block:(completedHander)block{
    //图片文本信息
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeImageMessage];
    msg.image = [UIImage imageNamed:@"LEGOAlert.bundle/success"];
    msg.message = message;
    msg.textAlignment = NSTextAlignmentCenter;
    msg.textInsets = UIEdgeInsetsMake(12, 30, -23, -30);
    [[[[[[LEGOAlertView new]addTitle:title]addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
}
+ (void)showErrorWithMessage:(NSString *)message{
    [self showErrorWithTitle:@"提示" message:message];
}
+ (void)showErrorWithTitle:(NSString *)title message:(NSString *)message{
    [self showErrorWithTitle:title message:message buttons:@[@"知道了"]];
}
+ (void)showErrorWithTitle:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons{
    [self showErrorWithTitle:title message:message buttons:buttons block:nil];
}
+ (void)showErrorWithTitle:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons block:(completedHander)block{
    //图片文本信息
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeImageMessage];
    msg.image = [UIImage imageNamed:@"LEGOAlert.bundle/error"];
    msg.message = message;
    msg.textAlignment = NSTextAlignmentCenter;
    msg.textInsets = UIEdgeInsetsMake(12, 30, -23, -30);
    [[[[[[LEGOAlertView new]addTitle:title]addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
}
//-----------------------自定义图片信息提示框-----------------------------//
+ (void)showImageWith:(UIImage *)image message:(NSString *)message{
    [self showImageWith:image title:@"提示" message:message];
}
+ (void)showImageWith:(UIImage *)image title:(NSString *)title message:(NSString *)message{
    [self showImageWith:image title:title message:message buttons:@[@"知道了"]];
}
+ (void)showImageWith:(UIImage *)image title:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons{
    [self showImageWith:image title:title message:message buttons:buttons block:nil];
}
+ (void)showImageWith:(UIImage *)image title:(NSString *)title message:(NSString *)message  buttons:(NSArray<NSString *> *)buttons block:(completedHander)block{
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeImageMessage];
    msg.image = image;
    msg.message = message;
    msg.textAlignment = NSTextAlignmentLeft;
    msg.imageInsets = UIEdgeInsetsMake(12, 0, 0, 0);
    msg.textInsets = UIEdgeInsetsMake(6, 30, -24, -30);
    [[[[[[LEGOAlertView new]addTitle:title]addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
}
//-----------------------Header是图片+内容是文本的提示框-----------------------------//
+ (void)showHeaderImage:(UIImage *)headerImage message:(NSString *)message{
    [self showHeaderImage:headerImage message:message buttons:@[@"知道了"]];
}
+ (void)showHeaderImage:(UIImage *)headerImage message:(NSString *)message buttons:(NSArray<NSString *> *)buttons{
    [self showHeaderImage:headerImage message:message buttons:buttons block:nil hasCloseButton:NO];
}
+ (void)showHeaderImage:(UIImage *)headerImage message:(NSString *)message buttons:(NSArray<NSString *> *)buttons block:(completedHander)block hasCloseButton:(BOOL)hasCloseButton{
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeMessage];
    msg.message = message;
    msg.textAlignment = NSTextAlignmentLeft;
    msg.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    msg.textInsets = UIEdgeInsetsMake(22, 30, -24, -30);
    if (hasCloseButton) {
        [[[[[[[LEGOAlertView new]addHeaderImage:headerImage]addMessage:msg]addButtons:buttons]addCompletedHander:block]addCloseButton] show];
    }
    else{
        [[[[[[LEGOAlertView new]addHeaderImage:headerImage]addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
    }

    
}

//-----------------------Header是图片+内容是富文本的提示框-----------------------------//
+ (void)showHeaderImage:(UIImage *)headerImage attributedMessage:(NSAttributedString *)attributedMessage{
    [self showHeaderImage:headerImage attributedMessage:attributedMessage buttons:@[@"知道了"]];
}
+ (void)showHeaderImage:(UIImage *)headerImage attributedMessage:(NSAttributedString *)attributedMessage buttons:(NSArray<NSString *> *)buttons{
    [self showHeaderImage:headerImage attributedMessage:attributedMessage buttons:buttons block:nil hasCloseButton:NO];
}
+ (void)showHeaderImage:(UIImage *)headerImage attributedMessage:(NSAttributedString *)attributedMessage buttons:(NSArray<NSString *> *)buttons block:(completedHander)block hasCloseButton:(BOOL)hasCloseButton{
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeAttributedMessage];
    msg.attributedMessage = attributedMessage;
    msg.textAlignment = NSTextAlignmentLeft;
    msg.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    msg.textInsets = UIEdgeInsetsMake(22, 30, -24, -30);
    if (hasCloseButton) {
        [[[[[[[LEGOAlertView new]addHeaderImage:headerImage]addMessage:msg]addButtons:buttons]addCompletedHander:block]addCloseButton] show];
    }
    else{
        [[[[[[LEGOAlertView new]addHeaderImage:headerImage]addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
    }

}

//-----------------------自定义视图的提示框-----------------------------//
+ (void)showCustom:(UIView *)custom{
    [self showCustom:custom title:@"提示"];
}
+ (void)showCustom:(UIView *)custom title:(NSString *)title{
    [self showCustom:custom title:title buttons:@[@"知道了"]];
}
+ (void)showCustom:(UIView *)custom buttons:(NSArray<NSString *> *)buttons{
    [self showCustom:custom title:@"提示" buttons:buttons];
}
+ (void)showCustom:(UIView *)custom title:(NSString *)title buttons:(NSArray<NSString *> *)buttons{
    [self showCustom:custom title:title buttons:buttons block:nil hasCloseButton:NO];
}
+ (void)showCustom:(UIView *)custom title:(NSString *)title buttons:(NSArray<NSString *> *)buttons block:(completedHander)block hasCloseButton:(BOOL)hasCloseButton{
    //内容为自定义视图
    LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeCustomView];
    msg.customView = custom;
    if (hasCloseButton) {
        [[[[[[[LEGOAlertView new]addTitle:title] addMessage:msg]addButtons:buttons]addCompletedHander:block]addCloseButton] show];
    }
    else{
        [[[[[[LEGOAlertView new]addTitle:title] addMessage:msg]addButtons:buttons]addCompletedHander:block]show];
    }
}

//-----------------------输入视图的提示框-----------------------------//
+ (void)showInputTextViewWithMessage:(NSString *)message  limit:(NSInteger)limit  placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextViewCompleteHander)block{
    [self showInputTextViewWithTitle:@"提示" message:message limit:limit placeholder:placeholder buttons:buttons block:block];
}
+ (void)showInputTextViewWithTitle:(NSString *)title message:(NSString *)message  limit:(NSInteger)limit  placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextViewCompleteHander)block{
    [self showInputTextViewWithTitle:title message:message limit:limit placeholder:placeholder buttons:buttons block:block hasCloseButton:NO];
}
+ (void)showInputTextViewWithTitle:(NSString *)title message:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextViewCompleteHander)block hasCloseButton:(BOOL)hasCloseButton{
    //使用LEGOAlertInputTextView作为自定义视图
    LEGOAlertInputTextView *inputView = [[LEGOAlertInputTextView alloc]initWithPlaceholder:placeholder limit:limit message:message];
    [self showCustom:inputView title:title buttons:buttons block:^(NSInteger answer){
        if (block) {
            block(inputView , answer);
        }
    }hasCloseButton:hasCloseButton];
}
//-----------------------输入视图TextField的提示框-----------------------------//
+ (LEGOAlertInputTextField *)showInputTextFieldWithMessage:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextFieldCompleteHander)block{
    return [self showInputTextFieldWithTitle:@"提示" message:message limit:limit placeholder:placeholder buttons:buttons block:block];
}
+ (LEGOAlertInputTextField *)showInputTextFieldWithTitle:(NSString *)title message:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextFieldCompleteHander)block{
    return [self showInputTextFieldWithTitle:title message:message limit:limit placeholder:placeholder buttons:buttons block:block hasCloseButton:NO];
}
+ (LEGOAlertInputTextField *)showInputTextFieldWithTitle:(NSString *)title message:(NSString *)message limit:(NSInteger)limit placeholder:(NSString *)placeholder buttons:(NSArray<NSString *> *)buttons block:(inputTextFieldCompleteHander)block hasCloseButton:(BOOL)hasCloseButton{
    //使用LEGOAlertInputTextField作为自定义视图
    LEGOAlertInputTextField *inputView = [[LEGOAlertInputTextField alloc]initWithPlaceholder:placeholder limit:limit message:message];
    [self showCustom:inputView title:title buttons:buttons block:^(NSInteger answer){
        if (block) {
            block(inputView , answer);
        }
    }hasCloseButton:hasCloseButton];
    return inputView;
}
@end
