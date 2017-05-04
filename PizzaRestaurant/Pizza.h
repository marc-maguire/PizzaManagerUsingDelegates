//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Marc Maguire on 2017-05-04.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PizzaSize){ //for Obj-C prefix the enum options with the typedef
    PizzaSizeSmall,
    PizzaSizeMedium,
    PizzaSizeLarge
};

@interface Pizza : NSObject

@property (nonatomic, readonly) NSArray *toppings;
@property (nonatomic, readonly) PizzaSize size; //enum is primitive

- (instancetype)initPizzaWithSize:(PizzaSize)size andToppings:(NSArray *)toppings;



@end
