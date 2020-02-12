//
//  UIApplication+LEGOViewController.h
//  app
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIApplication (LEGOViewController)

+(UITabBarController *)tabbarController;

+(UINavigationController *)currentTabbarSelectedNavigationController;

+(UINavigationController *)navigationControllerByTabbarIndex:(NSInteger)tabbarIndex;


////这个nv有可能是present出来的
//+(LEGONavigationController *)getCurrentNavigationController;

+(UIViewController *)getCurrentViewController;


//看是否有present出来的VC,如果没有返回nil
+ (UIViewController *)getPresentedViewController;


@end
