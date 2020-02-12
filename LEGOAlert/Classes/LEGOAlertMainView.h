//
//  LEGOAlertMainView.h
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import <UIKit/UIKit.h>
@class LEGOAlertMessage;
@interface LEGOAlertMainView : UIScrollView
- (instancetype)initWithMessage:(LEGOAlertMessage *)message;
@end
