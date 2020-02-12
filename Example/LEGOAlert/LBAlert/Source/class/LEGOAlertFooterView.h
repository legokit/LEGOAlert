//
//  LEGOAlertFooterView.h
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import <UIKit/UIKit.h>
@class LEGOAlertFooterView;
@protocol LEGOAlertFooterViewDelegate <NSObject>
- (void)LEGOAlertFooterViewDidClickButtonAt:(NSInteger)index forAlertFooterView:(LEGOAlertFooterView *)alertFooterView;
@end
@interface LEGOAlertFooterView : UIView
@property(nonatomic , weak)id<LEGOAlertFooterViewDelegate> delegate;
- (instancetype)initWithButtons:(NSArray<NSString *> *)buttons;
@end
