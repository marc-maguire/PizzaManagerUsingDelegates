//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-04.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype)initPizzaWithSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    
    if (self = [super init]) {
        
        _size = size;
        _toppings = toppings;
        
    }
    return self;
}

@end
