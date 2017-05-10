//
//  Manager.m
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Manager.h"
#import "Kitchen.h"

@implementation Manager

//required
- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    
    for (NSString* topping in toppings) {
        if ([topping containsString:@"anchovies"]){
            return NO;
        }
        }
    
    return YES;
}

-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    
    return NO;
    
}

- (void)deliverPizza:(Pizza *)pizza {
    
    [self.delegate deliverPizza:pizza];
    
}

-(void)kitchenDidMakePizza:(Pizza *)pizza {
    
    [self deliverPizza:pizza];
}

- (NSString *)welcomeMessage {
    return @"I'm angry as hell";
}
//optional

@end
