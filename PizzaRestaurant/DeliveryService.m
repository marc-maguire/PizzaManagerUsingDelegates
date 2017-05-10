//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"


@implementation DeliveryService

- (void)deliverPizza:(Pizza *)pizza {
    
    [self.delegate deliverPizza:pizza];
}

@end
