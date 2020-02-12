//
//  LEGOViewController.m
//  LEGOAlert
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
// 

#import "LEGOViewController.h"
#import <Masonry/Masonry.h>
#import "LEGOAlert.h"

@interface LEGOViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSString *> *dataArray;
@end

@implementation LEGOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"LEGOAlert";
    self.dataArray = @[@"提示框",@"询问框",@"富文本框",@"图文框",@"输入框",@"文本框",@"自定义视图"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                [LEGOAlert say:@"I want to say something"];
                
            }
            break;
            
            
        case 1:
            {
                
                [LEGOAlert ask:^(NSInteger answer) {
            
                } message:@"Do u love me do u love me?" buttons:@[@"取消",@"确定"]];
            }
            break;
            
        case 2:
            {
                
                NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:@"富文本" attributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle), NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:22]}];
                [LEGOAlert showWithMessage:attributeString];
            }
            break;
            
        case 3:
            {
                            
                [LEGOAlert showImageWith:[UIImage imageNamed:@"image_xxx_2"] message:@"1111111111111111111111111111111111111"];
            }
            break;
            
        case 4:
            {
                            
                [LEGOAlert showInputTextFieldWithMessage:@"" limit:99 placeholder:@"请输入文字" buttons:@[@"拒绝",@"暂不处理",@"同意"] block:^(LEGOAlertInputTextField *input, NSInteger answer) {
            
                }];
            }
            break;
            
        case 5:
            {
                            
                [LEGOAlert showInputTextViewWithMessage:@"1231231" limit:99 placeholder:@"123123" buttons:@[@"取消",@"暂不处理",@"暂存",@"提交"] block:^(LEGOAlertInputTextView *input, NSInteger answer) {
            
                }];
            }
            break;
            
        case 6:
            {
                            
//                LEGOAlertMessage *msg = [[LEGOAlertMessage alloc] initType:LEGOAlertMessageTypeMessage];
//                msg.message = @"313123";
                
                LEGOAlertMessage *msg = [[LEGOAlertMessage alloc]initType:LEGOAlertMessageTypeImageMessage];
                msg.image = [UIImage imageNamed:@"LEGOAlert.bundle/success"];
                msg.message = @"12312";
                msg.textAlignment = NSTextAlignmentCenter;
                msg.textInsets = UIEdgeInsetsMake(12, 30, -23, -30);
                                
                [[[[[[LEGOAlertView new] addMessage:msg] addTitle:@"title"] addButtons:@[@"1",@"2",@"3",@"4"]] addCompletedHander:^(NSInteger index) {
                    
                }] show];
            }
            break;
            
        default:
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identity = @"uitableviewcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = (id <UITableViewDataSource>)self;
        _tableView.delegate = (id<UITableViewDelegate>)self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


@end
