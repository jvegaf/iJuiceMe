//
//  flavour.m
//  iJuiceMe
//
//  Created by Jose Vega on 14/11/14.
//  Copyright (c) 2014 Jose Vega. All rights reserved.
//

#import "Flavour.h"

@implementation Flavour

-(float)quantitybypercentage:(int)percentage toAmount:(int)amount
{
    return (amount * 1.0) * (percentage *1.0) / 100;
}

@end
