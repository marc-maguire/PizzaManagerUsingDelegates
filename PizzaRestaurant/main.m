//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "InputHandler.h"
#import "CheeryManager.h"
#import "Manager.h"
#import "DeliveryService.h"
#import "DeliveryCar.h"


//Understand class methods
//Understand how constructor methods work
//Prepare them to understand composition of methods into convenience methods

Manager *_mediumManager;
CheeryManager *cheeryManager;


Manager * manager() {
    if (!_mediumManager) {
        _mediumManager = [Manager new];
    }
    return _mediumManager;
}

PizzaSize convertSizeStringToPizzaSize(NSString *sizeString) {
    
    PizzaSize result = PizzaSizeLarge;
    
    if ([sizeString isEqualToString:@"small"]) {
        result = PizzaSizeSmall;
    } else if ([sizeString isEqualToString:@"medium"]) {
        result = PizzaSizeMedium;
    }
    
    return result;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        NSLog(@"Please pick your pizza size and toppings:");
        //KISS
        
        Kitchen *kitchen = [[Kitchen alloc]init];
        DeliveryService *deliveryService = [[DeliveryService alloc]init];
        DeliveryCar *deliveryCar = [[DeliveryCar alloc]init];
        deliveryService.delegate = deliveryCar;
       
        
        while (TRUE) {
            
            NSLog(@"\n\nRing Ring.....\n\nRing Ring.....\n\nWelcome to the Pizza Kitchen!\nPlease press '1' to order from our General Manager or press '2' to order from our Happy Manager:");
            
            NSString *managerSelected = [InputHandler initiateUserInteraction];
            
            id<KitchenDelegate>currentManager = [managerSelected isEqualToString:@"1"] ? manager() :  [[CheeryManager alloc]init];
            [currentManager setDelegate:deliveryService];
            kitchen.delegate = currentManager;
            // 
//            if ([inputHandler containsString:@"1"]) {
////                mediumManager = mediumManager ? mediumManager : [[Manager alloc]init];
//                
//                manager().delegate = deliveryService;
//                kitchen.delegate = manager();
//                NSLog(@"Hi there! I'm the General Manager, what can I get for you today?");
//            } else if ([inputHandler containsString:@"2"]) {
//                CheeryManager *cheeryManager =
//                cheeryManager.delegate = deliveryService;
//                kitchen.delegate = cheeryManager;
//                NSLog(@"Happiest of days to you, super valued customer! What glorious cheese creation can I whip up for you today?");
//            }
            NSLog(@"To cook a small, medium or large pizza, enter the size and toppings in the following format:\nsize topping1 topping2 topping3 etc:\n");
            
            NSString *inputString = [InputHandler initiateUserInteraction];
            NSArray *pizzaOrder = [inputString componentsSeparatedByString:@" "];
            NSString *size = pizzaOrder.firstObject;
            NSArray *toppings = [pizzaOrder subarrayWithRange:NSMakeRange(1, ([pizzaOrder count]-1))];
//            Pizza *pizza;
            
            // simplify by making a convenience function
            PizzaSize pizzaSize = convertSizeStringToPizzaSize(size);
            
            [kitchen makePizzaWithSize:pizzaSize toppings:toppings];
           
//            if ([size isEqualToString:@"small"]) {
//                pizza = [kitchen makePizzaWithSize:PizzaSizeSmall toppings:toppings];
//            } else if ([size isEqualToString:@"medium"]){
//                pizza = [kitchen makePizzaWithSize:PizzaSizeMedium toppings:toppings];
//            } else if ([size isEqualToString:@"large"]) {
//                pizza = [kitchen makePizzaWithSize:PizzaSizeLarge toppings:toppings];
//            } else {
//                NSLog(@"Not a valid pizza size!");
//            }
         //can try to do the parsing with subarray with range
         
        }

    }
    return 0;
}



