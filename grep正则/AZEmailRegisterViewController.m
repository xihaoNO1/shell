//
//  AZEmailRegisterViewController.m
//  AmazfitWatch
//
//  Created by hongzhiqiang on 2018/5/15.
//  Copyright © 2018年 lixian@huami.com. All rights reserved.
//

#import "AZEmailRegisterViewController.h"

@interface AZEmailRegisterViewController ()

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation AZEmailRegisterViewController

#pragma mark - Appearance

- (UIColor *)appearance_viewBackgroundColor {
    return [UIColor colorWithHEXString:@"0xf4f5f7" Alpha:1.f];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册".login_localizedString;
    [self nameTextField];
    [self emailTextField];
    [self passwordField];
    [self registerButton];
}

#pragma mark - click

- (void)clickRegister:(UIButton *)sender {
    if (self.nameTextField.text.length == 0) {
        [self makeToast:@"请输入姓名".login_localizedString];
        return;
    }
    if (self.emailTextField.text.length == 0) {
        [self makeToast:@"请输入邮箱".login_localizedString];
        return;
    }
    if (![self isValidateEmail:self.emailTextField.text]) {
        [self makeToast:@"请输入正确的邮箱".login_localizedString];
        return;
    }
    if (self.passwordField.text.length == 0) {
        [self makeToast:@"请输入密码".login_localizedString];
        return;
    }
    NSString *title = @"hhhh";
    [self showHUDText:@"正在注册...".login_localizedString];
    [AZUser registerWithEmail:self.emailTextField.text
            password:self.passwordField.text
            name:self.nameTextField.text
            region:self.contryCode
            viewController:self block:^(BOOL success, NSString *message, NSError *error) {
                [self hideHUD];
                [self.delegate emailRegisterViewController:self
                                                     email:self.emailTextField.text
                                                  password:self.passwordField.text
                                         didRegisterSucess:success
                                                     error:message];
                   
    }];
}

- (BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark - lazy

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [UITextField new];
        _nameTextField.placeholder = @"请输入姓名".login_localizedString;
        _nameTextField.spellCheckingType = UITextSpellCheckingTypeNo;
        [self.view addSubview:_nameTextField];
        [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset = 18;
            make.right.offset = -18;
            make.height.offset = 50;
            make.top.offset = 80;
        }];
        UIView *line = [UIView new];
        line.backgroundColor = RGBAHexCOLOR(@"000000", 0.3);
        [_nameTextField addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset = 0;
            make.height.offset = 0.5;
        }];
    }
    return _nameTextField;
}
- (UITextField *)emailTextField {
    if (!_emailTextField) {
        _emailTextField = [UITextField new];
        _emailTextField.spellCheckingType = UITextSpellCheckingTypeNo;
        _emailTextField.placeholder = @"请输入邮箱".login_localizedString;
        [self.view addSubview:_emailTextField];
        [_emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset = 18;
            make.right.offset = -18;
            make.height.offset = 50;
            make.top.mas_equalTo(self.nameTextField.mas_bottom).offset = 0;
        }];
        UIView *line = [UIView new];
        line.backgroundColor = RGBAHexCOLOR(@"000000", 0.3);
        [_emailTextField addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset = 0;
            make.height.offset = 0.5;
        }];
    }
    return _emailTextField;
}

- (UITextField *)passwordField {
    if (!_passwordField) {
        _passwordField = [UITextField new];
        _passwordField.spellCheckingType = UITextSpellCheckingTypeNo;
        _passwordField.secureTextEntry = YES;
        _passwordField.spellCheckingType = UITextSpellCheckingTypeNo;
        _passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
        _passwordField.placeholder = @"请输入密码".login_localizedString;
        [self.view addSubview:_passwordField];
        [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset = 18;
            make.right.offset = -18;
            make.height.offset = 50;
            make.top.mas_equalTo(self.emailTextField.mas_bottom).offset = 0;
        }];
        UIView *line = [UIView new];
        line.backgroundColor = RGBAHexCOLOR(@"000000", 0.3);
        [_passwordField addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset = 0;
            make.height.offset = 0.5;
        }];
    }
    return _passwordField;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"注册".login_localizedString forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerButton.backgroundColor = RGBCOLOR(214, 44, 0);
        _registerButton.titleLabel.font = [UIFont pingFangSCMediumFontOfSize:14];
        [_registerButton addTarget:self action:@selector(clickRegister:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_registerButton];
        [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset = 30;
            make.right.offset = -30;
            make.height.offset = 45;
            make.top.mas_equalTo(self.passwordField.mas_bottom).offset = 40;
        }];
    }
    return _registerButton;
}
@"我说".device_localizedString,hhhhhhhhh,bbb,@"aaa",@"你是".home_localizedString
@end
