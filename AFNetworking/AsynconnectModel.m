//
//  AsynconnectModel.m
//  我的分界面
//
//  Created by 可乐 on 14-3-11.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import "AsynconnectModel.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"


NSString * const HS_TripConnection =@"http://api.breadtrip.com/accounts/signup/";
NSString *const RS_TripConnection = @"http://api.breadtrip.com/accounts/login/";

@implementation AsynconnectModel


//get请求
//+(void)asyncGetWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block
//{
//    
//    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
//    [ manager GET:urlstr parameters:parmaters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"respone ===%@",responseObject);
//        block(responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error ==%@",error);
//    }];
//    
//    
//}

+(void)asyncPostWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block
{
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    
    [manage POST:urlstr parameters:parmaters success:^(AFHTTPRequestOperation *operation,id responseObject){
        block(responseObject);
        NSLog(@"response====%@",responseObject);
    }
         failure:^(AFHTTPRequestOperation *operation,NSError *error){
             NSLog(@"error======%@",error);
         }];
    
}
+(void)asyncPostWithParmaUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block
{
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
    
    [request setHTTPMethod:@"POST"];
    [manage HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response === %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error == %@",error);
    }];
}

+(void)connectionWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block{
    AsynconnectModel *model = [[AsynconnectModel alloc] init];
    [model startWithUrl:urlstr parmaters:parmaters finishBlock:block];
    [model release];
}

-(void)startWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block{
    _connBlock = Block_copy(block);
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
    
    NSString *par = @"";
    for (NSString *key in parmaters) {
        if ([par length] == 0) {
            par = [NSString stringWithFormat:@"%@=%@",key,[parmaters objectForKey:key]];
        }else{
            par = [NSString stringWithFormat:@"%@&%@=%@",par,key,[parmaters objectForKey:key]];
        }
        
    }
    
    NSData *data = [par dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    [request setHTTPMethod:@"POST"];
    [NSURLConnection connectionWithRequest:request delegate:self];
//    z账号密码：蓝鸥大连6 1234567890
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _receiveData = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receiveData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //    NSString *str = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
    NSString *str = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"str == %@",str);
    NSError *error = nil;
    id dic= [NSJSONSerialization JSONObjectWithData:_receiveData options:(NSJSONReadingMutableContainers) error:&error];
    if (error) {
        NSLog(@"error jason ===%@",error);
    }
    _connBlock(dic);
    
}





@end
