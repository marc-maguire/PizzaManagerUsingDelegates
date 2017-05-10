//
//  Kitchen.h
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
@class Kitchen;
//@class DeliveryService;
#import "DeliveryService.h"

@protocol KitchenDelegate <NSObject>

@required

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;
- (void)setDelegate:(id<PizzaDeliveryProtocol>)delegate;
//@property (nonatomic,weak) id <PizzaDeliveryProtocol> delegate;
- (NSString *)welcomeMessage;

@optional

- (void)kitchenDidMakePizza:(Pizza *)pizza;

@end


@interface Kitchen : NSObject

@property (nonatomic, strong) id <KitchenDelegate> delegate;

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings;


@end
