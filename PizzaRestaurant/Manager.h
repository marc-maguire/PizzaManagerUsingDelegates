//
//  Manager.h
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "DeliveryService.h"

@interface Manager : NSObject <KitchenDelegate>

@property (nonatomic,weak) id <PizzaDeliveryProtocol> delegate;

- (void)deliverPizza:(Pizza *)pizza;


@end
