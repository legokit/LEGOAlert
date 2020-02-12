#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FlipDismissAnimationController.h"
#import "FlipPresentAnimationController.h"
#import "LEGOAlert.h"
#import "LEGOAlertCloseButton.h"
#import "LEGOAlertFooterView.h"
#import "LEGOAlertHeaderView.h"
#import "LEGOAlertInputTextField.h"
#import "LEGOAlertInputTextView.h"
#import "LEGOAlertMainView.h"
#import "LEGOAlertMessage.h"
#import "LEGOAlertView.h"
#import "UIApplication+LEGOViewController.h"
#import "UITextView+Placeholder.h"

FOUNDATION_EXPORT double LEGOAlertVersionNumber;
FOUNDATION_EXPORT const unsigned char LEGOAlertVersionString[];

