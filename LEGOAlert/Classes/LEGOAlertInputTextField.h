//
//  LEGOAlertInputTextField.h
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface LEGOAlertInputTextField : UIView
@property(nonatomic , strong)UITextField *textField;
- (instancetype)initWithPlaceholder:(NSString *)placeholder limit:(NSInteger)limit message:(NSString *)message;
@end
