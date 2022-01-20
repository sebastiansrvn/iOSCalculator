//
//  Math.m
//  Calculator
//
//  Created by Sebastian Servin on 1/7/22.
//

#import <Foundation/Foundation.h>
#import "Math.h"

@implementation Math

- (instancetype) init {
    return self;
}

- (NSNumber *) add: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo {
    return [NSNumber numberWithInt:([numberOne intValue] + [numberTwo intValue])];
}

- (NSNumber *) divide: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo {
    return [NSNumber numberWithInt:([numberOne intValue] / [numberTwo intValue])];
}

- (NSNumber *) multiply: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo {
    return [NSNumber numberWithInt:([numberOne intValue] * [numberTwo intValue])];
}

- (NSNumber *) subtract: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo {
    return [NSNumber numberWithInt:([numberOne intValue]  - [numberTwo intValue])];
}

@end
