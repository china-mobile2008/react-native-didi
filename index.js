'use strict';

import { DeviceEventEmitter, NativeModules, Platform } from 'react-native';
import { EventEmitter } from 'events';

let isAppRegistered = false;
const { DIDI } = NativeModules;

function wrapRegisterApp(nativeFunc) {
  if (!nativeFunc) {
    return undefined;
  }
  return (...args) => {
    if (isAppRegistered) {
      return Promise.resolve(true);
    }
    isAppRegistered = true;
    return new Promise((resolve, reject) => {
      nativeFunc.apply(null, [
        ...args,
        (error, result) => {
          if (!error) {
            return resolve(result);
          }
          if (typeof error === 'string') {
            return reject(new Error(error));
          }
          reject(error);
        },
      ]);
    });
  };
}

function wrapApi(nativeFunc) {
  if (!nativeFunc) {
    return undefined;
  }
  return (...args) => {
    if (!isAppRegistered) {
      return Promise.reject(new Error('registerApp required.'));
    }
    return new Promise((resolve, reject) => {
      nativeFunc.apply(null, [
        ...args,
        (error, result) => {
          if (!error) {
            return resolve(result);
          }
          if (typeof error === 'string') {
            return reject(new Error(error));
          }
          reject(error);
        },
      ]);
    });
  };
}

/**
 *  注册app
 *
 *  @param appId  开发者网站申请的appid
 *  @param secret 开发者网站申请的secret
 */
export const registerApp = wrapRegisterApp(DIDI.registerApp);

/**
 *  通过该方法调起滴滴页面
 *
 *  @param parentController 展现滴滴页面的ViewController
 *  @param animated         展现滴滴页面时是否需要动画
 *  @param optionParams     可选参数
 *  @param delegate         代理
 */
export const showDDPage = wrapRegisterApp(DIDI.showDDPage);

/**
*  拨打手机号码
*
*  @param phone  手机号码加密字符串
*  @param prompt 拨打电话是否弹出提示
*  @param error  错误信息
*/
export const callPhone = wrapRegisterApp(DIDI.callPhone);

/**
*  异步获取ticket
*
*  @param ticketType  ticketType分为single和long两种，single类型每次请求完就失效，long类型有一定失效周期。
*  @param resultBlock 结果回调
*/
export const asyncGetTicket = wrapRegisterApp(DIDI.asyncGetTicket);

/**
*  同步获取ticket
*
*  @param ticketType  ticketType分为single和long两种，single类型每次请求完就失效，long类型有一定失效周期。
*  @param resultError 错误信息
*
*  @return 返回结果数据
*/
export const syncGetTicket = wrapRegisterApp(DIDI.syncGetTicket);

/**
*  打开制定页面
*
*  @param pageName    页面名称
*  @param params      所需参数信息
*  @param navTheme    页面导航栏定制
*  @param resultBlock 结果回调,回调中返回页面的viewController
*/
export const openPage = wrapRegisterApp(DIDI.openPage);

/**
*  异步请求开放API接口
*
*  @param apiName     API名称
*  @param dict        API所需参数
*  @param resultBlock 结果回调
*/
export const asyncCallOpenAPI = wrapRegisterApp(DIDI.asyncCallOpenAPI);

/**
*  同步请求开放API接口
*
*  @param apiName     API名称
*  @param dict        API所需参数
*  @param resultError 错误信息
*
*  @return 返回结果数据
*/
export const syncCallOpenAPI = wrapRegisterApp(DIDI.syncCallOpenAPI);

/**
*  检查打车主页是否登陆
*
*  @return 已登录返回YES,未登录返回NO
*/
export const checkLogin = wrapRegisterApp(DIDI.checkLogin);
