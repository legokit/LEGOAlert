//
//  LEGOAlertInputTextField.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlertInputTextField.h"
#import <Masonry/Masonry.h>

@interface LEGOAlertInputTextField()<UITextFieldDelegate>
@property(nonatomic , assign)NSInteger limit;
@end
@implementation LEGOAlertInputTextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // 获取textView中得内容
    NSMutableString *str = [[NSMutableString alloc]initWithString:textField.text];
    [str replaceCharactersInRange:range withString:string];
    if ( str.length >  self.limit ){
        return NO;
    }
    return YES;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectZero];
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = [UIColor blackColor];
        _textField.delegate = self;
        _textField.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 36)];
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}
- (instancetype)initWithPlaceholder:(NSString *)placeholder limit:(NSInteger)limit message:(NSString *)message
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        self.backgroundColor = self.textField.backgroundColor;
        self.layer.cornerRadius = 2.0;
        self.layer.masksToBounds = YES;
        [self addSubview:self.textField];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.height.mas_equalTo(36);
        }];
       
        self.limit = limit;
        self.textField.placeholder = placeholder;
        self.textField.text = message;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.textField);
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
