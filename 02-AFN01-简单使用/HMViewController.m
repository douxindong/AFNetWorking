//
//  HMViewController.m
//  02-AFN01-简单使用
//
//  Created by apple on 14-7-1.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "AFNetworking.h"
#import "NetWorkingUtil.h"
#import "SVProgressHUD.h"
#import "HMAppDelegate.h"
#define KEY_DeviceTokenString           @"tokenString"  //token的值
#define API_BASE_URL(_URL_) [NSString stringWithFormat:@"http://114.215.107.206:8021/%@",_URL_]
#define SocketSuccessed               @"0"    // 响应成功
#define SocketFailed               @"-1"    // 响应失败
@interface HMViewController ()
{
    UITextField *text1;
   
}
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getNetWorkData];
    text1=[[UITextField alloc]initWithFrame:CGRectMake(20, 50, 200, 30)];
    text1.backgroundColor=[UIColor redColor];
    [self.view addSubview:text1];
    
}

-(void)getNetWorkData{
    
    //http://114.215.107.206:8021/kuai-app/income.do?userPwd=111&userMobile=111网络连接是这个，返回-1，参数不对，有数据返回
    NSMutableDictionary *dicts = self.getParams;
    [[NetWorkingUtil getNetWorkingUtil]requestZcwl4MethodUrl:API_BASE_URL(@"kuai-app/income.do") parameters:dicts hud:nil result:^(id objs, int status, NSString *msg) {
        //前面的是网络请求链接，后面是请求参数dicts，hud警告框，obj得到的结果，创建字典dict读取objs
        NSDictionary *dict = objs;
        
        if (dict) {
//            [self.appDelegate showHudIsSuccess:YES msg:@"成功了" duration:1.8];
            NSLog(@"you are  success");
//            [SVProgressHUD showWithStatus:@"success"];// 小菊花
//            [SVProgressHUD showWithStatus:@"成功" maskType:SVProgressHUDMaskTypeGradient];//效菊花背景
//            [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];//只是小酒话
//            [SVProgressHUD showSuccessWithStatus:@"you are  success"];//一闪而过（有小对勾）
//            [SVProgressHUD showErrorWithStatus:@"you are Error"];//小错号
            
            NSString *msgCode = [dict objectForKey:@"msgCode"];
           NSLog(@"%@",msgCode);
            if ([SocketSuccessed isEqualToString:msgCode])
            {
                //接收返回状态码为0的内容
                 NSString *msg=[dict objectForKey:@"msgCode"];
                text1.text=[NSString stringWithFormat:@"%@",msg];
               
             }
            if ([SocketFailed isEqualToString:msgCode])
            {
                //接收返回状态码为-1的内容，这个错误是请求失败，上面有接口，是上一家公司的，数据可能是错的。
                NSString *msg=[dict objectForKey:@"msgCode"];
                text1.text=[NSString stringWithFormat:@"%@",msg];
                
            }

        }
        else
        {
            [self.appDelegate hideHud];
            [self.appDelegate showHudIsSuccess:NO msg:@"网络异常!" duration:.8];
        }
        
    }];
    
}

-(NSMutableDictionary*)getParams{
    NSString *userId = @"111";
    NSString *phone = @"111";
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:userId,@"userMobile",phone,@"userPwd", nil];
}
/*
-(void)getData{
    NSMutableDictionary *dictory = self.getPig;
    [[NetWorkingUtil getNetWorkingUtil]requestZcwl4MethodUrl:APP_BASE_URL(@"/page/d/o/s/d0165gkr5os.html") parameters:dictory hud:nil result:^(id objs, int status, NSString *msg) {
        
        //前面的是网络请求链接，后面是请求参数dicts，hud警告框，obj得到的结果，创建字典dict读取objs
        NSDictionary *dict = objs;
        
        if (dict) {
            [self.appDelegate showHudIsSuccess:YES msg:@"成功了" duration:10.8];
            NSLog(@"you are  success");
            NSString *msgCode = [dict objectForKey:@"msgCode"];
            //            NSLog(@"%@",msgCode);
            if ([SocketSuccessed isEqualToString:msgCode])
            {
                
                NSString *msg=[dict objectForKey:@"totalAmount"];
                text1.text=[NSString stringWithFormat:@"%@",msg];

            }
        }
        else
        {
            [self.appDelegate hideHud];
            [self.appDelegate showHudIsSuccess:NO msg:@"网络异常!" duration:.8];
        }
        
    }];


    
}
 */
//-(NSMutableDictionary*)getPig{
//    NSString *__t = @"1";
//    NSString *ptag = @"1.qq";
//    NSString *_out=@"9";
//    return [NSMutableDictionary dictionaryWithObjectsAndKeys:__t,@"__t",ptag,@"ptag",_out,@"_out" ,nil];
//    //http://v.qq.com/page/d/o/s/d0165gkr5os.html?__t=1&ptag=1.qq&_out=9
//}

-(HMAppDelegate*) appDelegate {
    return (HMAppDelegate*)[[UIApplication sharedApplication] delegate];
}


//- (void)fetchQuestionTypeDataWithParameters
//{
//    /**
//     * 请求方法1
//     */
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];  //如果报接受类型不一致请替换一致text/html或别的
//    
//    manager.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//     NSString *postUrl = @"http://114.215.107.206:8021/kuai-app/getCategoryList.douserId=6&mobilePhone=13632817764";
//    [manager POST:postUrl parameters:self.getParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"ok  ok  ok%@",responseObject);
//        
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"you  are  default ");
//    }];
//}
//
//- (void)videoXML
//{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    mgr.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    
//    // 2.发送POST请求
//    [mgr POST:@"http://114.215.107.206:8021/kuai-app/getCategoryList.do" parameters:@{@"parentld" : @"siteld"}
//     success:^(AFHTTPRequestOperation *operation, NSXMLParser *parser) {
//         
//     }
//     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//     //    NSLog(@"请求失败---%@", error);
//     }];
//}
//
///*
//- (void)video
//{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.发送GET请求
//    [mgr GET:@"http://114.215.107.206:8021/kuai-app/getCategoryList.do" parameters:nil
//     success:^(AFHTTPRequestOperation *operation, NSDictionary *dict) { //  responseObject : 在这种情况下是字典
//         NSLog(@"请求成功---%@", dict[@"videos"]);
//     }
//     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         NSLog(@"请求失败---%@", error);
//     }];
//}
//*/
//- (void)login
//{
//    // 1.获得请求管理者(管理请求, 帮助发请求)
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    // 声明服务器返回的数据是JSON
//        mgr.responseSerializer = [AFJSONResponseSerializer serializer];
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html",nil];
//    // 2.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//  //  params[@"mobilePhone"] = @"13632817764";
//   // params[@"userId"] = @"1";
//    params[@"siteId"] = @"4";
// 
//    NSString *postUrl = @"http://114.215.107.206:8021/kuai-app/getCategoryList.do";
//    // 3.发送GET请求
//    [mgr POST:postUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        
//        NSString *str = [responseObject objectForKey:@"msgCode"];
//        NSArray *arr = [responseObject objectForKey:@"incomeArray"];
// //       NSDictionary *dic = [responseObject objectForKey:@"KEY 3"];
//        
//        //...
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"00000000Error: %@", error);
//        self.view.backgroundColor=[UIColor purpleColor];
//    }];
////    [mgr GET:@"http://114.215.107.206:8021/kuai-app/getCategoryList.do" parameters:params
////     success:^(AFHTTPRequestOperation *operation, id responseObject) { //  responseObject : 在这种情况下是字典
////         NSLog(@"请求成功---%@", responseObject);
////     }
////     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////         NSLog(@"请求失败---%@", error);
////     }];
//}
@end
