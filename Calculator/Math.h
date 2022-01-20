//
//  Math.h
//  Calculator
//
//  Created by Sebastian Servin on 1/7/22.
//

#ifndef Math_h
#define Math_h

@interface Math : NSObject

@property NSNumber *currentVal;

- (instancetype) init;
- (NSNumber *) add: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo;
- (NSNumber *) subtract: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo;
- (NSNumber *) multiply: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo;
- (NSNumber *) divide: (NSNumber *)numberOne andNumberTwo: (NSNumber *)numberTwo;
@end

#endif /* Math_h */
