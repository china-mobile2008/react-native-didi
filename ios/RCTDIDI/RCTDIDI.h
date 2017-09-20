//
//  RCTDIDI.h
//  RCTDIDI
//
//  Created by zhangkun on 2017/9/20.
//  Copyright © 2017年 china-mobile2008. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DIOpenSDK.h"
#import <React/RCTBridgeModule.h>

@interface RCTDIDI : NSObject <RCTBridgeModule, DIOpenSDKDelegate>

@property NSString* appId;
@property NSString* secret;

@end
