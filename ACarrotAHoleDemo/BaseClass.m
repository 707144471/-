//
//  BaseClass.m
//
//  Created by 未来 联创 on 2017/1/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Data.h"


NSString *const kBaseClassCode = @"code";
NSString *const kBaseClassData = @"data";
NSString *const kBaseClassMsg = @"msg";
NSString *const kBaseClassReqArgs = @"req_args";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize code = _code;
@synthesize data = _data;
@synthesize msg = _msg;
@synthesize reqArgs = _reqArgs;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [[self objectOrNilForKey:kBaseClassCode fromDictionary:dict] doubleValue];
            self.data = [Data modelObjectWithDictionary:[dict objectForKey:kBaseClassData]];
            self.msg = [self objectOrNilForKey:kBaseClassMsg fromDictionary:dict];
            self.reqArgs = [self objectOrNilForKey:kBaseClassReqArgs fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kBaseClassCode];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kBaseClassData];
    [mutableDict setValue:self.msg forKey:kBaseClassMsg];
    [mutableDict setValue:self.reqArgs forKey:kBaseClassReqArgs];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.code = [aDecoder decodeDoubleForKey:kBaseClassCode];
    self.data = [aDecoder decodeObjectForKey:kBaseClassData];
    self.msg = [aDecoder decodeObjectForKey:kBaseClassMsg];
    self.reqArgs = [aDecoder decodeObjectForKey:kBaseClassReqArgs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_code forKey:kBaseClassCode];
    [aCoder encodeObject:_data forKey:kBaseClassData];
    [aCoder encodeObject:_msg forKey:kBaseClassMsg];
    [aCoder encodeObject:_reqArgs forKey:kBaseClassReqArgs];
}

- (id)copyWithZone:(NSZone *)zone {
    BaseClass *copy = [[BaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = self.code;
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.reqArgs = [self.reqArgs copyWithZone:zone];
    }
    
    return copy;
}


@end
