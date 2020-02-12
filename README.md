# LEGOAlert

The view interaction box component can use prompt box, inquiry box, attributed string box, image-text box, textField box, textView box, and custom box, and more support content scrolling, horizontal and vertical screen adaptation, and height customization.
视图交互框组件，可以使用提示框、询问框、富文本框、图文框、输入框、文本框、自定义框，更支持内容滚动、横竖屏适配、高度自定义。
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LEGOAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LEGOAlert'
```

**LEGOAlert** is the photo management tool, you can get album list, photo list, save photos, delete photos, get photos by iCloud, cancel photo request  照片管理工具，可以获取相册列表、照片列表，保存照片、删除照片，通过 iCloud 获取照片，取消照片请求

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Features

- [x] Prompt box.  提示框
- [x] Inquiry box.  询问框
- [x] Attributed string.  富文本
- [x] TextField box.  输入框
- [x] TextView box.  文本框
- [x] image-text box.  图文框
- [x] Custom box.  自定义视图
- [x] Content scrolling.  滚动显示
- [x] Horizontal and Vertical screen.  横竖屏适配



## Requirements

- iOS 8.0+
- Xcode 10.0+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate LEGOPhotosManager into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'LEGOAlert'
```

### Manually

If you prefer not to use any of the dependency mentioned above, you can integrate LEGOPhotosManager into your project manually. Just drag & drop the `Sources` folder to your project.

## ⚠️⚠️⚠️ WARNING ⚠️⚠️⚠️ New functions!
### Content scrolling.  滚动显示

![image](https://github.com/legokit/LEGOAlert/blob/master/Resources/scrolling.jpeg)

### Custom box.  自定义添加，随意组合，自由搭配！

```
// custom add. 自定义添加，互不影响
- (instancetype)addTitle:(NSString *)title;
- (instancetype)addMessage:(LEGOAlertMessage *)message;
- (instancetype)addCloseButton;
- (instancetype)addButtons:(NSArray<NSString *> *)buttons;
- (instancetype)addCompletedHander:(void(^)(NSInteger))completedHander;
 ```
 ```
[[[[[[LEGOAlertView new] addMessage:msg] addTitle:@"title"] addButtons:@[@"1",@"2",@"3",@"4"]] addCompletedHander:^(NSInteger index) {
                    
 }] show];
 ```
 
## Usage

### Prompt box.Inquiry box.  提示框 询问框
```
  [LEGOAlert say:@"I want to say something"];
```
```
  [LEGOAlert ask:^(NSInteger answer) {
            
   } message:@"Do u love me do u love me?" buttons:@[@"取消",@"确定"]];
```

![image](https://github.com/legokit/LEGOAlert/blob/master/Resources/say.jpeg)
![image](https://github.com/legokit/LEGOAlert/blob/master/Resources/ask.jpeg)

### TextField box.  输入框
```
  [LEGOAlert showInputTextFieldWithMessage:@"" limit:99 placeholder:@"请输入文字" buttons:@[@"拒绝",@"暂不处理",@"同意"]         block:^(LEGOAlertInputTextField *input, NSInteger answer) {
            
   }];
```
![image](https://github.com/legokit/LEGOAlert/blob/master/Resources/textField.jpeg)
![image](https://github.com/legokit/LEGOAlert/blob/master/Resources/textView.jpeg)

### image-text box.  图文框
```
[LEGOAlert showImageWith:[UIImage imageNamed:@"image_xxx_2"] message:@"123"]；
```
![image](https://github.com/legokit/LEGOAlert/blob/master/Resources/image-text.jpeg)


For details, see example for LEGOAlert.

## Author

564008993@qq.com, yangqingren@yy.com

## License

LEGOAlert is available under the MIT license. See the LICENSE file for more info.

