//
//  RestAUX.h
//  LisbonSpotsDuarte
//
//  Created by Formando FLAG on 28/01/15.
//  Copyright (c) 2015 refresh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestAUX : NSObject

//Método que devolve o URL de JSON
+(NSURL *) spotsURL;

//metodo que faz get/parse ao json e insere no coredata
+(BOOL) getSpots;

@end
