//
//  Data.h
//
//  Created by 未来 联创 on 2017/1/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Company;

@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *commId;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, assign) BOOL owner;
@property (nonatomic, assign) id countyName;
@property (nonatomic, assign) id cityName;
@property (nonatomic, strong) Company *company;
@property (nonatomic, assign) id countyId;
@property (nonatomic, assign) double vendor;
@property (nonatomic, assign) id provinceName;
@property (nonatomic, assign) id provinceId;
@property (nonatomic, assign) id cityId;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
