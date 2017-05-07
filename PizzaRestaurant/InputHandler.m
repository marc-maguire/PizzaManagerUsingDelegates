//
//  InputHandler.m
//  Maths
//
//  Created by Marc Maguire on 2017-05-02.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

+(NSString *)initiateUserInteraction {
    
    char inputChars[255];
    fgets(inputChars, 255, stdin);
    NSString *result = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *parsedString = [result stringByTrimmingCharactersInSet:charSet];
    
    return parsedString;
}

@end


