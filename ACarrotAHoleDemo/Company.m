//
//  Company.m
//
//  Created by 未来 联创 on 2017/1/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Company.h"


NSString *const kCompanyWebsiteUrl = @"websiteUrl";
NSString *const kCompanyIntroImgs = @"introImgs";
NSString *const kCompanyName = @"name";
NSString *const kCompanyFullName = @"fullName";
NSString *const kCompanyDescription = @"description";


@interface Company ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Company

@synthesize websiteUrl = _websiteUrl;
@synthesize introImgs = _introImgs;
@synthesize name = _name;
@synthesize fullName = _fullName;
@synthesize companyDescription = _companyDescription;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.websiteUrl = [self objectOrNilForKey:kCompanyWebsiteUrl fromDictionary:dict];
            self.introImgs = [self objectOrNilForKey:kCompanyIntroImgs fromDictionary:dict];
            self.name = [self objectOrNilForKey:kCompanyName fromDictionary:dict];
            self.fullName = [self objectOrNilForKey:kCompanyFullName fromDictionary:dict];
            self.companyDescription = [self objectOrNilForKey:kCompanyDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.websiteUrl forKey:kCompanyWebsiteUrl];
    NSMutableArray *tempArrayForIntroImgs = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.introImgs) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIntroImgs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIntroImgs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIntroImgs] forKey:kCompanyIntroImgs];
    [mutableDict setValue:self.name forKey:kCompanyName];
    [mutableDict setValue:self.fullName forKey:kCompanyFullName];
    [mutableDict setValue:self.companyDescription forKey:kCompanyDescription];

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

    self.websiteUrl = [aDecoder decodeObjectForKey:kCompanyWebsiteUrl];
    self.introImgs = [aDecoder decodeObjectForKey:kCompanyIntroImgs];
    self.name = [aDecoder decodeObjectForKey:kCompanyName];
    self.fullName = [aDecoder decodeObjectForKey:kCompanyFullName];
    self.companyDescription = [aDecoder decodeObjectForKey:kCompanyDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_websiteUrl forKey:kCompanyWebsiteUrl];
    [aCoder encodeObject:_introImgs forKey:kCompanyIntroImgs];
    [aCoder encodeObject:_name forKey:kCompanyName];
    [aCoder encodeObject:_fullName forKey:kCompanyFullName];
    [aCoder encodeObject:_companyDescription forKey:kCompanyDescription];
}

- (id)copyWithZone:(NSZone *)zone {
    Company *copy = [[Company alloc] init];
    
    
    
    if (copy) {

        copy.websiteUrl = [self.websiteUrl copyWithZone:zone];
        copy.introImgs = [self.introImgs copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.fullName = [self.fullName copyWithZone:zone];
        copy.companyDescription = [self.companyDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
