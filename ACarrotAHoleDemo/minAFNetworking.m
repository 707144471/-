//
//  minAFNetworking.m
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/13.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "minAFNetworking.h"
#import "Header.h"
@implementation minAFNetworking
+(void)obtainDatablock:(void(^)(NSDictionary *dic))block
{
    // 启动系统风火轮
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //前面写服务器给的域名，后面拼接上需要提交的参数，假如参数是key=1
    
    NSString*domainStr=@"https://api.ishareonline.cn//apis/v1/get_community_info?&appKey=2a82bdb5cc85e401b4b5ef5c3185ccf1&commId=17";
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    //以GET的形式提交，只需要将上面的请求地址给GET做参数就可以
[manager  GET:domainStr parameters:self progress:^(NSProgress * _Nonnull downloadProgress) {
    
} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    
    block(dic);
    
    
    
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
}];
}
@end
