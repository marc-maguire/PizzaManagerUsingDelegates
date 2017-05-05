//
//  InputHandler.m
//  Maths
//
//  Created by Marc Maguire on 2017-05-02.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

+(NSArray *)initiateUserInteraction {
    
    
    char str[100];
    NSLog(@"Welcome to the Pizza Kitchen!\nTo cook a small, medium or large pizza, enter the size and toppings in the following format:\nsize topping1 topping2 topping3 etc:\n");
    fgets (str, 100, stdin);
    
    NSString *inputString = [[NSString alloc] initWithUTF8String:str];
    inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // Take the first word of the command as the size, and the rest as the toppings
    NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
    
    return commandWords;
}

@end


//char inputChars[255];
//printf("Please enter your answer: ");
//fgets(inputChars, 255, stdin);
//NSString *result = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
//NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//NSString *parsedString = [result stringByTrimmingCharactersInSet:charSet];
//NSInteger parsedStringIntValue = [parsedString intValue];

