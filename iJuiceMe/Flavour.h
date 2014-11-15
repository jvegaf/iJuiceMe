//
//  flavour.h
//  iJuiceMe
//
//  Created by Jose Vega on 14/11/14.
//  Copyright (c) 2014 Jose Vega. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flavour : NSObject

@property (weak,nonatomic) NSString *name;
@property int percentage;
@property float quantity;
@property BOOL Vg;


-(float)quantitybypercentage:(int)percentage toAmount:(int)amount;


@end
