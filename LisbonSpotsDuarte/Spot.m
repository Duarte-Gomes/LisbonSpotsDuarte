//
//  Spot.m
//  LisbonSpotsDuarte
//
//  Created by Formando FLAG on 28/01/15.
//  Copyright (c) 2015 refresh. All rights reserved.
//

#import "Spot.h"
#import "AppDelegate.h"


@implementation Spot

@dynamic identifier;
@dynamic type;
@dynamic name;
@dynamic phone;
@dynamic desc;
@dynamic latitude;
@dynamic longitude;

+(instancetype)spotWithJSONDict: (NSDictionary *)JSONDict {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = appDelegate.managedObjectContext;
    
    Spot *newSpot = [NSEntityDescription insertNewObjectForEntityForName:@"Spot" inManagedObjectContext:moc];
    
    if (newSpot != nil) {
        // ler do jsondict e adicionar as vars de newspot
        newSpot.identifier = [[JSONDict valueForKey:@"id"] intValue];
        newSpot.type = [JSONDict valueForKey:@"type"];
        newSpot.name = [JSONDict valueForKey:@"name"];
        newSpot.phone = [JSONDict valueForKey:@"phone"];
        newSpot.desc = [JSONDict valueForKey:@"desc"];
        newSpot.latitude = [[JSONDict valueForKey:@"latitude"] doubleValue];
        newSpot.longitude = [[JSONDict valueForKey:@"longitude"] doubleValue];
    }
    //forçar o sync com o coredata
    [appDelegate saveContext];
    return newSpot;
}

+ (NSArray *)fetchAllSpots {
    return [Spot fetchAllSpotsWithType:nil];
}

+ (NSArray *)fetchAllSpotsWithType:(NSString *)type {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = appDelegate.managedObjectContext;
    
    //criar o fetchrequest para a entity spot
    NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:@"Spot"];
    
    //filtrar por type
    if (type != nil) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type == %@", type];
        
        [fetch setPredicate:predicate];
    }
    
    //executar o fetch
    NSError *err;
    NSArray *results = [moc executeFetchRequest:fetch error:&err];
    
    //verificar se tem erro
    if (err != nil)
        return nil;
    
    //devolvo um array com os spots
    return results;

}

- (NSString *)description {
    return [NSString stringWithFormat:@"[%d] - %@", self.identifier, self.name];
}




@end
