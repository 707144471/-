//
//  Data.m
//
//  Created by 未来 联创 on 2017/1/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Company.h"


NSString *const kDataId = @"id";
NSString *const kDataCommId = @"commId";
NSString *const kDataContact = @"contact";
NSString *const kDataOwner = @"owner";
NSString *const kDataCountyName = @"countyName";
NSString *const kDataCityName = @"cityName";
NSString *const kDataCompany = @"company";
NSString *const kDataCountyId = @"countyId";
NSString *const kDataVendor = @"vendor";
NSString *const kDataProvinceName = @"provinceName";
NSString *const kDataProvinceId = @"provinceId";
NSString *const kDataCityId = @"cityId";
NSString *const kDataName = @"name";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize dataIdentifier = _dataIdentifier;
@synthesize commId = _commId;
@synthesize contact = _contact;
@synthesize owner = _owner;
@synthesize countyName = _countyName;
@synthesize cityName = _cityName;
@synthesize company = _company;
@synthesize countyId = _countyId;
@synthesize vendor = _vendor;
@synthesize provinceName = _provinceName;
@synthesize provinceId = _provinceId;
@synthesize cityId = _cityId;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [[self objectOrNilForKey:kDataId fromDictionary:dict] doubleValue];
            self.commId = [self objectOrNilForKey:kDataCommId fromDictionary:dict];
            self.contact = [self objectOrNilForKey:kDataContact fromDictionary:dict];
            self.owner = [[self objectOrNilForKey:kDataOwner fromDictionary:dict] boolValue];
            self.countyName = [self objectOrNilForKey:kDataCountyName fromDictionary:dict];
            self.cityName = [self objectOrNilForKey:kDataCityName fromDictionary:dict];
            self.company = [Company modelObjectWithDictionary:[dict objectForKey:kDataCompany]];
            self.countyId = [self objectOrNilForKey:kDataCountyId fromDictionary:dict];
            self.vendor = [[self objectOrNilForKey:kDataVendor fromDictionary:dict] doubleValue];
            self.provinceName = [self objectOrNilForKey:kDataProvinceName fromDictionary:dict];
            self.provinceId = [self objectOrNilForKey:kDataProvinceId fromDictionary:dict];
            self.cityId = [self objectOrNilForKey:kDataCityId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kDataId];
    [mutableDict setValue:self.commId forKey:kDataCommId];
    [mutableDict setValue:self.contact forKey:kDataContact];
    [mutableDict setValue:[NSNumber numberWithBool:self.owner] forKey:kDataOwner];
    [mutableDict setValue:self.countyName forKey:kDataCountyName];
    [mutableDict setValue:self.cityName forKey:kDataCityName];
    [mutableDict setValue:[self.company dictionaryRepresentation] forKey:kDataCompany];
    [mutableDict setValue:self.countyId forKey:kDataCountyId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vendor] forKey:kDataVendor];
    [mutableDict setValue:self.provinceName forKey:kDataProvinceName];
    [mutableDict setValue:self.provinceId forKey:kDataProvinceId];
    [mutableDict setValue:self.cityId forKey:kDataCityId];
    [mutableDict setValue:self.name forKey:kDataName];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kDataId];
    self.commId = [aDecoder decodeObjectForKey:kDataCommId];
    self.contact = [aDecoder decodeObjectForKey:kDataContact];
    self.owner = [aDecoder decodeBoolForKey:kDataOwner];
    self.countyName = [aDecoder decodeObjectForKey:kDataCountyName];
    self.cityName = [aDecoder decodeObjectForKey:kDataCityName];
    self.company = [aDecoder decodeObjectForKey:kDataCompany];
    self.countyId = [aDecoder decodeObjectForKey:kDataCountyId];
    self.vendor = [aDecoder decodeDoubleForKey:kDataVendor];
    self.provinceName = [aDecoder decodeObjectForKey:kDataProvinceName];
    self.provinceId = [aDecoder decodeObjectForKey:kDataProvinceId];
    self.cityId = [aDecoder decodeObjectForKey:kDataCityId];
    self.name = [aDecoder decodeObjectForKey:kDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kDataId];
    [aCoder encodeObject:_commId forKey:kDataCommId];
    [aCoder encodeObject:_contact forKey:kDataContact];
    [aCoder encodeBool:_owner forKey:kDataOwner];
    [aCoder encodeObject:_countyName forKey:kDataCountyName];
    [aCoder encodeObject:_cityName forKey:kDataCityName];
    [aCoder encodeObject:_company forKey:kDataCompany];
    [aCoder encodeObject:_countyId forKey:kDataCountyId];
    [aCoder encodeDouble:_vendor forKey:kDataVendor];
    [aCoder encodeObject:_provinceName forKey:kDataProvinceName];
    [aCoder encodeObject:_provinceId forKey:kDataProvinceId];
    [aCoder encodeObject:_cityId forKey:kDataCityId];
    [aCoder encodeObject:_name forKey:kDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    Data *copy = [[Data alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.commId = [self.commId copyWithZone:zone];
        copy.contact = [self.contact copyWithZone:zone];
        copy.owner = self.owner;
        copy.countyName = [self.countyName copyWithZone:zone];
        copy.cityName = [self.cityName copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.countyId = [self.countyId copyWithZone:zone];
        copy.vendor = self.vendor;
        copy.provinceName = [self.provinceName copyWithZone:zone];
        copy.provinceId = [self.provinceId copyWithZone:zone];
        copy.cityId = [self.cityId copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
