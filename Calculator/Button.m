//
//  Button.m
//  Calculator
//
//  Created by Sebastian Servin on 1/7/22.
//

#import <Foundation/Foundation.h>
#import "Button.h"

@implementation Button
- (instancetype) initWithDimensions:(NSString *)name andXOffset:(CGFloat)xOffset andYOffset:(CGFloat)yOffset andWidth:(CGFloat)width andHeight:(CGFloat)height {
    if (self = [super init]) {
        self.name = name;
        self.xOffset = xOffset;
        self.yOffset = yOffset;
        self.width = width;
        self.height = height;
    }
    return self;
}

- (NSArray *) getArrayWithDimensions {
//    NSArray *toReturnTwo = [[NSArray alloc] initWithObjects:@"GHJK", nil];
    NSArray *toReturn = [[NSArray alloc] initWithObjects:
                          self.name,
                          [NSNumber numberWithFloat:self.xOffset],
                          [NSNumber numberWithFloat:self.yOffset],
                          [NSNumber numberWithFloat:self.width],
                          [NSNumber numberWithFloat:self.height], nil];
    return toReturn;
}

@end
