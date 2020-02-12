//
//  LEGOAlertInputView.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlertInputTextView.h"
#import <Masonry/Masonry.h>
#import "UITextView+Placeholder.h"
@interface LEGOAlertInputTextView()<UITextViewDelegate>

@end
@implementation LEGOAlertInputTextView

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    // 获取textView中得内容
    NSMutableString *string = [[NSMutableString alloc]initWithString:textView.text];
    [string replaceCharactersInRange:range withString:text];
    if ( string.length >  [[self.limitLabel.text componentsSeparatedByString:@"/"].lastObject integerValue] ){
        return NO;
    }
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    
    self.limitLabel.text = [NSString stringWithFormat:@"%ld/%@",textView.text.length,[self.limitLabel.text componentsSeparatedByString:@"/"].lastObject];
}
- (UILabel *)limitLabel{
    if (!_limitLabel) {
        _limitLabel = [UILabel new];
        _limitLabel.textColor = [UIColor colorWithRed:232/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
        _limitLabel.font = [UIFont systemFontOfSize:13];
    }
    return _limitLabel;
}
- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectZero];
        _textView.scrollEnabled = YES;
        _textView.editable = YES;
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.textColor = [UIColor blackColor];
        _textView.delegate = self;
        _textView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
        _textView.placeholderColor = [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:1.0];
        [_textView setTextContainerInset:UIEdgeInsetsMake(12, 6, 6, 6)];
    
    }
    return _textView;
}
- (instancetype)initWithPlaceholder:(NSString *)placeholder limit:(NSInteger)limit message:(NSString *)message
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        self.backgroundColor = self.textView.backgroundColor;
        self.layer.cornerRadius = 2.0;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.textView];
        self.textView.placeholder = placeholder;
        self.textView.text = message;
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self).offset(-20);
        }];
        
        
        self.limitLabel.text = [NSString stringWithFormat:@"%ld/%ld",message.length,(long)limit];
        [self addSubview:self.limitLabel];
        [self.limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@13);
            make.bottom.equalTo(self).offset(-5);
            make.right.equalTo(self).offset(-12);
        }];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(112);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
