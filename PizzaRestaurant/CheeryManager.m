//
//  CheeryManager.m
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "CheeryManager.h"

@implementation CheeryManager

-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    
    NSLog(@"You rock! Have a super duper day!");
    return YES;
    
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    
    return YES;
    
}

- (NSString *)welcomeMessage {
    return @"yo man";
}

@end
