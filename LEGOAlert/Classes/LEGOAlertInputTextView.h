//
//  LEGOAlertInputView.h
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface LEGOAlertInputTextView : UIView
@property(nonatomic , strong )UITextView *textView;
@property(nonatomic , strong )UILabel *limitLabel;
- (instancetype)initWithPlaceholder:(NSString *)placeholder limit:(NSInteger)limit message:(NSString *)message;
@end
