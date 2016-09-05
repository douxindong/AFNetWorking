//
//  HMAppDelegate.h
//  02-AFN01-简单使用
//
//  Created by apple on 14-7-1.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL hudIsHide;//hud是否隐藏了
- (void)showHud:(NSString*)str;
- (void)hideHud;
- (void)showHudIsSuccess:(BOOL)isSuccess msg:(NSString*)msg duration:(CGFloat)duration;
@end
