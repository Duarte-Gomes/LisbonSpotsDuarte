//
//  Spot.h
//  LisbonSpotsDuarte
//
//  Created by Formando FLAG on 28/01/15.
//  Copyright (c) 2015 refresh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Spot : NSManagedObject

@property (nonatomic) int32_t identifier;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;


//construtor que cria um spot no coredata, recebendo um jsondict como argumento
+(instancetype)spotWithJSONDict: (NSDictionary *)JSONDict;

//metodos que devolvam instancias de spot
+(NSArray *)fetchAllSpots;
+(NSArray *)fetchAllSpotsWithType: (NSString *)type;
@end
