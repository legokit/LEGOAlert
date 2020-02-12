//
//  LEGOAlertMessage.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import "LEGOAlertMessage.h"

@interface LEGOAlertMessage()
@property(nonatomic , assign )LEGOAlertMessageType type;
@end
@implementation LEGOAlertMessage
- (instancetype)initType:(LEGOAlertMessageType)type
{
    self = [super init];
    if (self) {
        _textAlignment = NSTextAlignmentCenter;
        _type = type;
        _textInsets = UIEdgeInsetsMake(22, 30, -23, -30);
        _imageInsets = UIEdgeInsetsMake(22, 0, 0, 0);
        _customViewInsets = UIEdgeInsetsMake(22, 25, -24, -25);
    }
    return self;
}
@end
