//
//  LEGOAlertMessage.h
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//注意这里的枚举指的是内容容器，不包含头部标题或者头部图片的
typedef NS_ENUM(NSUInteger, LEGOAlertMessageType) {
    LEGOAlertMessageTypeMessage,//普通文本
    LEGOAlertMessageTypeAttributedMessage,//属性文本
    LEGOAlertMessageTypeImageMessage,//带图片的文本
    LEGOAlertMessageTypeImageAttributedMessage,//带图片的属性文本
    LEGOAlertMessageTypeCustomView,//自定义视图
};
@interface LEGOAlertMessage : NSObject
//外部设置使用
@property(nonatomic , strong)NSString *message;
@property(nonatomic , strong)NSAttributedString *attributedMessage;
@property(nonatomic , assign)UIEdgeInsets textInsets;//文本外边距
@property(nonatomic , assign)NSTextAlignment textAlignment;//对齐方式

@property(nonatomic , strong)UIImage *image;//图片
@property(nonatomic , assign)UIEdgeInsets imageInsets;//图片外边距

@property(nonatomic , strong)UIView *customView;//自定义视图
@property(nonatomic , assign)UIEdgeInsets customViewInsets;//自定义视图外边距

@property(nonatomic , assign)NSInteger limit;//输入框字数限制
@property(nonatomic , assign , readonly)LEGOAlertMessageType type;

- (instancetype)initType:(LEGOAlertMessageType)type;
@end
