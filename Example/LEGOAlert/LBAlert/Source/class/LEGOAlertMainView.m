//
//  LEGOAlertMainView.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlertMainView.h"
#import <Masonry/Masonry.h>
#import "LEGOAlertMessage.h"

@interface LEGOAlertMainView()
@property(nonatomic , strong)UILabel *tipLabel;//提示标签视图
@property(nonatomic , strong)UIImageView *tipImageView;//提示图片视图
@end
@implementation LEGOAlertMainView
- (void)layoutSubviews{
    [super layoutSubviews];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.contentSize.height).priorityLow();
    }];
}
- (instancetype)initWithMessage:(LEGOAlertMessage *)message
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        switch (message.type) {
            case LEGOAlertMessageTypeMessage:
            {
                NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:message.message];
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributed];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:5];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
                self.tipLabel.attributedText = attributedString;
                self.tipLabel.textAlignment = message.textAlignment;
                [self.tipLabel sizeToFit];
                [self addSubview:self.tipLabel];
                
                [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(message.textInsets.left);
                    make.right.equalTo(self).offset(message.textInsets.right);
                    make.top.equalTo(self).offset(message.textInsets.top);
                    make.bottom.equalTo(self).offset(message.textInsets.bottom);
                    make.width.mas_equalTo(self).offset(message.textInsets.right-message.textInsets.left);
                }];


            }
                break;
            case LEGOAlertMessageTypeAttributedMessage:
            {
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:message.attributedMessage];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:5];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [message.attributedMessage length])];
                self.tipLabel.attributedText = attributedString;
                self.tipLabel.textAlignment = message.textAlignment;
                [self.tipLabel sizeToFit];
                [self addSubview:self.tipLabel];
                
                [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(message.textInsets.left);
                    make.right.equalTo(self).offset(message.textInsets.right);
                    make.top.equalTo(self).offset(message.textInsets.top);
                    make.bottom.equalTo(self).offset(message.textInsets.bottom);
                    make.width.mas_equalTo(self).offset(message.textInsets.right-message.textInsets.left);
                }];

            }
                break;
            case LEGOAlertMessageTypeImageMessage:
            {
                self.tipImageView.image = message.image;
                [self addSubview:self.tipImageView];
                
                [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(message.imageInsets.top);
                    make.centerX.equalTo(self);
                }];
                
                NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:message.message];
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributed];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:5];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
                self.tipLabel.attributedText = attributedString;
                self.tipLabel.textAlignment = message.textAlignment;
                [self.tipLabel sizeToFit];
                [self addSubview:self.tipLabel];
                
                [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(message.textInsets.left);
                    make.right.equalTo(self).offset(message.textInsets.right);
                    make.top.equalTo(self.tipImageView.mas_bottom).offset(message.textInsets.top);
                    make.bottom.equalTo(self).offset(message.textInsets.bottom);
                    make.width.mas_equalTo(self).offset(message.textInsets.right-message.textInsets.left);
                }];
                
                

            }
                break;
            case LEGOAlertMessageTypeImageAttributedMessage:
            {
                self.tipImageView.image = message.image;
                [self addSubview:self.tipImageView];
                
                [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(message.imageInsets.top);
                    make.centerX.equalTo(self);
                }];
                
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:message.attributedMessage];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:5];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [message.attributedMessage length])];
                self.tipLabel.attributedText = attributedString;
                self.tipLabel.textAlignment = message.textAlignment;
                [self.tipLabel sizeToFit];
                [self addSubview:self.tipLabel];

                
                [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(message.textInsets.left);
                    make.right.equalTo(self).offset(message.textInsets.right);
                    make.top.equalTo(self.tipImageView.mas_bottom).offset(message.textInsets.top);
                    make.bottom.equalTo(self).offset(message.textInsets.bottom);
                    make.width.mas_equalTo(self).offset(message.textInsets.right-message.textInsets.left);
                }];

            }
                break;
            case LEGOAlertMessageTypeCustomView:
            {
                UIView *view = message.customView;
                [self addSubview:view];
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(message.customViewInsets.left);
                    make.right.equalTo(self).offset(message.customViewInsets.right);
                    make.top.equalTo(self).offset(message.customViewInsets.top);
                    make.bottom.equalTo(self).offset(message.customViewInsets.bottom);
                    make.width.mas_equalTo(self).offset(message.customViewInsets.right-message.customViewInsets.left);
                    
                }];
                
            }
                break;
                
            default:
                break;
        }
        
    }
    return self;
}
- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc]init];
        _tipLabel.textColor = [UIColor colorWithRed:69/255.0 green:69/255.0 blue:69/255.0 alpha:1.0];
        _tipLabel.textAlignment = NSTextAlignmentLeft;
        _tipLabel.font = [UIFont systemFontOfSize:14];
        _tipLabel.numberOfLines = 0;
    }
    return _tipLabel;
}
- (UIImageView *)tipImageView{
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc]init];
        _tipImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _tipImageView;
}
@end
