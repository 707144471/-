//
//  minAFNetworking.h
//  ACarrotAHoleDemo
//
//  Created by 联创未来 on 2017/1/13.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface minAFNetworking : NSObject
+(void)obtainDatablock:(void(^)(NSDictionary *dic))block;
@end
