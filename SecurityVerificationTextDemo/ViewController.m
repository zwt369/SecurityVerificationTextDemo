//
//  ViewController.m
//  SecurityVerificationTextDemo
//
//  Created by Tony Zhang on 16/7/19.
//  Copyright © 2016年 Tony Zhang. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)OpenSecretAction:(id)sender {
    
    //创建安全验证对象
    LAContext * con = [[LAContext alloc]init];
    NSError * error;
    //判断是否支持密码验证
    /**
     *LAPolicyDeviceOwnerAuthentication 手机密码的验证方式
     *LAPolicyDeviceOwnerAuthenticationWithBiometrics 指纹的验证方式
     */
    BOOL can = [con canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
    if (can) {
        [con evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"验证信息" reply:^(BOOL success, NSError * _Nullable error) {
            NSLog(@"%d,%@",success,error);
        }];
        
    }
}


- (IBAction)OpenFingerAction:(id)sender {
    
    LAContext * con = [[LAContext alloc]init];
    NSError * error;
    BOOL can = [con canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    NSLog(@"%d",can);
    if (can) {
        [con evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"验证指纹" reply:^(BOOL success, NSError * _Nullable error) {
            NSLog(@"%d,%@",success,error);
        }];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
