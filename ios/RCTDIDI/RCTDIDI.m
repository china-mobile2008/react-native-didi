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

RCT_EXPORT_METHOD(registerApp:(NSString *)appid
                  :(NSString*)secret
                  :(RCTResponseSenderBlock)callback)
{
    self.appId = appid;
    self.secret = secret;
    callback(@[[DIOpenSDK registerApp:appid secret:secret]]);
}

RCT_EXPORT_METHOD(showDDPage:(UIViewController *)parentController
                  :(BOOL)animated
                  :(DIOpenSDKRegisterOptions *)optionParams
                  :(id<DIOpenSDKDelegate>)delegate
                  :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK showDDPage:parentController
                            animated:animated
                              params:optionParams
                            delegate:delegate]]);
}

RCT_EXPORT_METHOD(callPhone:(NSString *)phone
                  :(BOOL)prompt
                  :(NSError *__autoreleasing *)error
                  :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK callPhone:phone
                             prompt:prompt
                              error:error]]);
}

RCT_EXPORT_METHOD(asyncGetTicket:(NSString *)ticketType
                  :(void (^)(NSError *error,DIBaseModel *model))resultBlock
                  :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK asyncGetTicket:ticketType
                             resultBlock:resultBlock]]);
}

RCT_EXPORT_METHOD(syncGetTicket:(NSString *)ticketType
                  :(NSError *__autoreleasing *)resultError
                  :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK syncGetTicket:ticketType
                            resultError:resultError]]);
}

RCT_EXPORT_METHOD(openPage:(NSString *)pageName
                  :(NSDictionary *)params
                  :(DITopNavigationTheme *)navTheme
                  :(void (^)(NSError *error,UIViewController *viewController))resultBlock
                  :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK openPage:pageName
                            params:params
                          navTheme:navTheme
                       resultBlock:resultBlock]]);
}

RCT_EXPORT_METHOD(asyncCallOpenAPI:(NSString *)apiName
                  :(NSDictionary *)dict
                  :(void (^)(NSError *error,DIBaseModel *model))resultBlock
                  :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK asyncCallOpenAPI:apiName
                                    params:dict
                               resultBlock:resultBlock]]);
}

RCT_EXPORT_METHOD(syncCallOpenAPI:(NSString *)apiName
                  :(NSDictionary *)dict
                  :(NSError *__autoreleasing *)resultError
                  :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK syncCallOpenAPI:apiName 
                                   params:dict
                              resultError:resultError]]);
}

RCT_EXPORT_METHOD(checkLogin :(RCTResponseSenderBlock)callback)
{
    callback(@[[DIOpenSDK checkLogin]]);
}
@end
