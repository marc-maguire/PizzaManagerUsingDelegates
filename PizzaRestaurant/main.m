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
#import "Manager.h"
#import "CheeryManager.h"
#import "Manager.h"
#import "DeliveryService.h"
#import "DeliveryCar.h"


//Understand class methods
//Understand how constructor methods work
//Prepare them to understand composition of methods into convenience methods

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [[Kitchen alloc]init];
        DeliveryService *bestService = [[DeliveryService alloc]init];
        DeliveryCar *fastestCar = [[DeliveryCar alloc]init];
        bestService.delegate = fastestCar;
        
        while (TRUE) {
            
            NSLog(@"\n\nRing Ring.....\n\nRing Ring.....\n\nWelcome to the Pizza Kitchen!\nPlease press '1' to order from our General Manager or press '2' to order from our Happy Manager:");
            NSString *inputHandler = [InputHandler initiateUserInteraction];
            
            if ([inputHandler containsString:@"1"]) {
                Manager *mediumManager = [[Manager alloc]init];
                mediumManager.delegate = bestService;
                restaurantKitchen.delegate = mediumManager;
                NSLog(@"Hi there! I'm the General Manager, what can I get for you today?");
            } else if ([inputHandler containsString:@"2"]) {
                CheeryManager *cheeryManager = [[CheeryManager alloc]init];
                cheeryManager.delegate = bestService;
                restaurantKitchen.delegate = cheeryManager;
                NSLog(@"Happiest of days to you, super valued customer! What glorious cheese creation can I whip up for you today?");
            }
            NSLog(@"To cook a small, medium or large pizza, enter the size and toppings in the following format:\nsize topping1 topping2 topping3 etc:\n");
            
            NSString *inputHandler2 = [InputHandler initiateUserInteraction];
            NSArray *sizeWord = [inputHandler2 componentsSeparatedByString:@" "];
            NSArray *toppingsArray = [sizeWord subarrayWithRange:NSMakeRange(1, ([sizeWord count]-1))];
            Pizza *pizza = [[Pizza alloc]init];
           
            if ([inputHandler2 containsString:@"small"]) {
                pizza = [restaurantKitchen makePizzaWithSize:PizzaSizeSmall toppings:toppingsArray];
            } else if ([inputHandler2 containsString:@"medium"]){
                pizza = [restaurantKitchen makePizzaWithSize:PizzaSizeMedium toppings:toppingsArray];
            } else if ([inputHandler2 containsString:@"large"]) {
                pizza = [restaurantKitchen makePizzaWithSize:PizzaSizeLarge toppings:toppingsArray];
            } else {
                NSLog(@"Not a valid pizza size!");
            }
         //can try to do the parsing with subarray with range
         
        }

    }
    return 0;
}

