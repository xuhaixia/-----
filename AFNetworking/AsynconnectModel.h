//
//  AsynconnectModel.h
//  我的分界面
//
//  Created by 可乐 on 14-3-11.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import <Foundation/Foundation.h>

//web引用
extern NSString * const HS_TripConnection;
extern NSString * const RS_TripConnection;

typedef void (^ConnectBlock)();
@interface AsynconnectModel : NSObject

{

    ConnectBlock _connBlock;
    NSMutableData * _receiveData;
}
//get异步加载数据
//+(void)asyncGetWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;


+(void)asyncPostWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;

+(void)asyncPostWithParmaUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;


+(void)connectionWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;
@end
