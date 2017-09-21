//
//  RCTDIDI.m
//  RCTDIDI
//
//  Created by china-mobile2008 on 2017/9/20.
//  Copyright © 2017年 china-mobile2008. All rights reserved.
//

#import "RCTDIDI.h"
#import <React/RCTEventDispatcher.h>
#import <React/RCTBridge.h>
#import <React/RCTLog.h>
#import <React/RCTImageLoader.h>

// Define error messages
#define NOT_REGISTERED (@"registerApp required.")
#define INVOKE_FAILED (@"DIDI API invoke returns false.")

@implementation RCTDIDI

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(registerApp:(NSString *)appId andSecret:(NSString *)secret callback:(RCTResponseSenderBlock)callback)
{
    self.appId = appId;
    self.secret = secret;
    [DIOpenSDK registerApp:appId secret:secret];
    BOOL isSuccess = TRUE;
    callback(@[isSuccess?@"true":@"false"]);
}

RCT_EXPORT_METHOD(showDDPage:(UIViewController *)parentController
                  :(BOOL)animated
                  :(DIOpenSDKRegisterOptions *)optionParams
                  :(id<DIOpenSDKDelegate>)delegate
                  :(RCTResponseSenderBlock)callback)
{
    [DIOpenSDK showDDPage:parentController
                            animated:animated
                              params:optionParams
                            delegate:delegate];
    callback(@[[NSNull null], @"showDDPage success!"]);
}

RCT_EXPORT_METHOD(callPhone:(NSString *)phone
                  andPrompt:(BOOL)prompt
                  callback:(RCTResponseSenderBlock)callback)
{
    [DIOpenSDK callPhone:phone prompt:prompt error:nil];
    BOOL isSuccess = TRUE;
    callback(@[isSuccess?@"true":@"false"]);
}

RCT_EXPORT_METHOD(asyncGetTicket:(NSString *)ticketType
                  :(void (^)(NSError *error,DIBaseModel *model))resultBlock
                  :(RCTResponseSenderBlock)callback)
{
    [DIOpenSDK asyncGetTicket:ticketType resultBlock:resultBlock];
    callback(@[[NSNull null], @"asyncGetTicket success!"]);
}

RCT_EXPORT_METHOD(syncGetTicket:(NSString *)ticketType
                  :(NSError *__autoreleasing *)resultError
                  :(RCTResponseSenderBlock)callback)
{
    [DIOpenSDK syncGetTicket:ticketType error:resultError];
    callback(@[[NSNull null], @"syncGetTicket success!"]);
}

RCT_EXPORT_METHOD(openPage:(NSString *)pageName
                  :(NSDictionary *)params
                  :(DITopNavigationTheme *)navTheme
                  :(void (^)(NSError *error,UIViewController *viewController))resultBlock
                  :(RCTResponseSenderBlock)callback)
{
    [DIOpenSDK openPage:pageName params:params navTheme:navTheme resultBlock:resultBlock];
    callback(@[[NSNull null], @"openPage success!"]);
}

RCT_EXPORT_METHOD(asyncCallOpenAPI:(NSString *)apiName
                  :(NSDictionary *)dict
                  :(void (^)(NSError *error,DIBaseModel *model))resultBlock
                  :(RCTResponseSenderBlock)callback)
{
    [DIOpenSDK asyncCallOpenAPI:apiName params:dict resultBlock:resultBlock];
    callback(@[[NSNull null], @"asyncCAllOpenAPI success!"]);
}

RCT_EXPORT_METHOD(syncCallOpenAPI:(NSString *)apiName
                  :(NSDictionary *)dict
                  :(NSError *__autoreleasing *)resultError
                  :(RCTResponseSenderBlock)callback)
{
    [DIOpenSDK syncCallOpenAPI:apiName params:dict error:resultError];
    callback(@[[NSNull null], @"syncCallOpenAPI success!"]);
}

RCT_EXPORT_METHOD(checkLogin :(RCTResponseSenderBlock)callback)
{
    //callback(@[[NSNull null], [DIOpenSDK checkLogin] ? [NSNull null] : INVOKE_FAILED]);
}

RCT_EXPORT_METHOD(sendFeedbackMessage:(NSInteger)actionId andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId callback:(RCTResponseSenderBlock)callback)
{
    BOOL isSuccess = TRUE;
    callback(@[isSuccess?@"true":@"false"]);
}

// 打车页面关闭回调
- (void)diopensdkMainPageClose
{
    //[self.bridge.eventDispatcher sendDeviceEventWithName:@"RCTDIOpenPageClose" body:@{@"appid":self.appId, @"code" :self.secret}];
}

// - (DITopNavigationTheme *)diopensdkTopNavigationTheme
// {
//     [self.bridge.eventDispatcher sendDeviceEventWithName:@"RCTDIOpenNavTheme" body:@{@"appid":self.appId, @"code" :self.secret}];
// }
@end
