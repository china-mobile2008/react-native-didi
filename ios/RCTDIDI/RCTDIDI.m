//
//  RCTDIDI.m
//  RCTDIDI
//
//  Created by zhangkun on 2017/9/20.
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

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(registerApp:(NSString *)appid
                  :(NSString*)secret
                  :(RCTResponseSenderBlock)callback)
{
    self.appId = appid;
    self.secret = secret;
    callback(@[[NSNull null], @([DIOpenSDK registerApp:appid secret:secret])]);
}

@end
