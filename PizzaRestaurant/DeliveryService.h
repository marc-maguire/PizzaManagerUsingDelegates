//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pizza;

@protocol PizzaDeliveryProtocol <NSObject>

- (void)deliverPizza:(Pizza *)pizza;

@end


@interface DeliveryService : NSObject <PizzaDeliveryProtocol>

@property (nonatomic, weak) id <PizzaDeliveryProtocol> delegate;

- (void)deliverPizza:(Pizza *)pizza;

@end
