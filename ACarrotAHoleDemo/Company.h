//
//  Company.h
//
//  Created by 未来 联创 on 2017/1/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Company : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id websiteUrl;
@property (nonatomic, strong) NSArray *introImgs;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, assign) id companyDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
