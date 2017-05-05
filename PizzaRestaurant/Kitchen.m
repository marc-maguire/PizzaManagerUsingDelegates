//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

//Create a delegate property on the Kitchen class.
//Use the KitchenDelegate methods in the makePizza... method.

//If there is a delegate set, call the first two methods before creating a pizza.

//If the delegate returns NO (false) for the shouldMakePizza method, don't make the pizza at all. If the delegate returns YES (true) for the shouldUpgrade method, then make a large pizza, no matter what was actually ordered.
//Once the pizza has been made, send a kitchenDidMakePizza message to the delegate. Remember, kitchenDidMakePizza is optional; so, you'll have to check in code to see if, whoever the delegate is, actually implements this method. If the delegate does respond, send the message, otherwise don't. (HINT: use respondsToSelector:. Look it up in the Documentation).

#import "Kitchen.h"
#import "Pizza.h"


@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    
    if (self.delegate) {
       BOOL shouldMake = [self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings];
       BOOL shouldUpgrade = [self.delegate kitchenShouldUpgradeOrder:self];
        if ((shouldMake) && (shouldUpgrade)) {
            
            Pizza *pizza = [[Pizza alloc]initPizzaWithSize:PizzaSizeLarge andToppings:toppings];
            NSLog(@"Mmmmm! Enjoy your pizza!");
            
            if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
                
                [self.delegate kitchenDidMakePizza:pizza];
               
                }
         
            return pizza;
        
        } else if ((shouldMake) && (!shouldUpgrade)) {
            
            Pizza *pizza = [[Pizza alloc]initPizzaWithSize:size andToppings:toppings];
            NSLog(@"Mmmmm! Enjoy your pizza!");
            
            if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
                
                [self.delegate kitchenDidMakePizza:pizza];
                
            }
            
            return pizza;
            
        } else {
            
            NSLog(@"Please come back in 5 minutes, our chef is on break");
            return nil;
            
        }
        

    } else {
        
        NSLog(@"Sorry, we are closed");
        return nil;
    }
    
}

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    
    return [self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings];
    
}
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    
    
    return [self.delegate kitchenShouldUpgradeOrder:self];
    
}


- (void)kitchenDidMakePizza:(Pizza *)pizza {
    
    NSLog(@"We made a %ld pizza with %@ toppings",(long)pizza.size, pizza.toppings);
    
}

@end
