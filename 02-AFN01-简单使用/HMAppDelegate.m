//
//  HMAppDelegate.m
//  02-AFN01-简单使用
//
//  Created by apple on 14-7-1.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMAppDelegate.h"
#import "SVProgressHUD.h"
@implementation HMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    }
-(void)showHud:(NSString*)str{
    [SVProgressHUD showWithStatus:str maskType:SVProgressHUDMaskTypeClear];
    self.hudIsHide = NO;
}
-(void)hideHud{
    [SVProgressHUD dismiss];
    self.hudIsHide = YES;
}
- (void)showHudIsSuccess:(BOOL)isSuccess msg:(NSString*)msg duration:(CGFloat)duration{
    if (isSuccess) {
        [SVProgressHUD showSuccessWithStatus:msg duration:duration];
    }else{
        [SVProgressHUD showErrorWithStatus:msg duration:duration];
    }
}
- (void)applicationDidEnterBackground:(UIApplication *)application{}
- (void)applicationWillEnterForeground:(UIApplication *)application{}
- (void)applicationDidBecomeActive:(UIApplication *)application{}
- (void)applicationWillTerminate:(UIApplication *)application{}

@end
