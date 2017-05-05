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
        
        Kitchen *restaurantKitchen = [Kitchen new];
        DeliveryService *bestService = [[DeliveryService alloc]init];
        DeliveryCar *fastestCar = [[DeliveryCar alloc]init];
        
        
        Manager *mediumManager = [[Manager alloc]init];
        //CheeryManager *cheeryManager = [[CheeryManager alloc]init];
        restaurantKitchen.delegate = mediumManager;
        mediumManager.delegate = bestService;
        bestService.delegate = fastestCar;
        
        while (TRUE) {
            // Loop forever
            
            NSArray *inputHandler = [InputHandler initiateUserInteraction];
            NSString *sizeWord = inputHandler[0];
            NSArray *toppingsArray = [inputHandler subarrayWithRange:NSMakeRange(1, ([inputHandler count]-1))];

            
            //NSMutableArray *toppingsArray = [[NSMutableArray alloc]initWithArray:commandWords];
            //[toppingsArray removeObjectAtIndex:0];
            //updated to do in 1 line
            
           
            if ([sizeWord containsString:@"small"]) {
                Pizza *pizza = [restaurantKitchen makePizzaWithSize:PizzaSizeSmall toppings:toppingsArray];
            } else if ([sizeWord containsString:@"medium"]){
                Pizza *pizza = [restaurantKitchen makePizzaWithSize:PizzaSizeMedium toppings:toppingsArray];
            } else if ([sizeWord containsString:@"large"]) {
                Pizza *pizza = [restaurantKitchen makePizzaWithSize:PizzaSizeLarge toppings:toppingsArray];
            } else {
                NSLog(@"Not a valid pizza size!");
            }
         //can try to do the parsing with subarray with range
         
        }

    }
    return 0;
}

