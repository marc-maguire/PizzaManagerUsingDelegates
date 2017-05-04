//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"


//Understand class methods
//Understand how constructor methods work
//Prepare them to understand composition of methods into convenience methods

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"Welcome to the Pizza Kitchen!\nTo cook a small, medium or large pizza, enter the size and toppings in the following format:\nsize topping1 topping2 topping3 etc:\n");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            NSString *sizeWord = commandWords[0];
            
            
            //NSMutableArray *toppingsArray = [[NSMutableArray alloc]initWithArray:commandWords];
            //[toppingsArray removeObjectAtIndex:0];
            //updated to do in 1 line
            NSArray *toppingsArray = [commandWords subarrayWithRange:NSMakeRange(1, ([commandWords count]-1))];

           
            if ([sizeWord containsString:@"small"]) {
                [restaurantKitchen makePizzaWithSize:PizzaSizeSmall toppings:toppingsArray];
            } else if ([sizeWord containsString:@"medium"]){
                [restaurantKitchen makePizzaWithSize:PizzaSizeMedium toppings:toppingsArray];
            } else if ([sizeWord containsString:@"large"]) {
                [restaurantKitchen makePizzaWithSize:PizzaSizeLarge toppings:toppingsArray];
            } else {
                NSLog(@"Not a valid pizza size!");
            }
         //can try to do the parsing with subarray with range
         
        }

    }
    return 0;
}

