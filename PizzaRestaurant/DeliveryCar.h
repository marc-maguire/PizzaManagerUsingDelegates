//
//  DeliveryCar.h
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#include "DeliveryService.h"

@interface DeliveryCar : NSObject <PizzaDeliveryProtocol>

- (void)deliverPizza:(Pizza *)pizza;

@end
