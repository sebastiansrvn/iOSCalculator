//
//  Button.h
//  Calculator
//
//  Created by Sebastian Servin on 1/7/22.
//

#ifndef Button_h
#define Button_h
#import <UIKit/UIKit.h>

@interface Button : NSObject

@property NSString *name;
@property CGFloat xOffset;
@property CGFloat yOffset;
@property CGFloat width;
@property CGFloat height;

// Initializer
- (instancetype) initWithDimensions: (NSString *)name andXOffset: (CGFloat)xOffset andYOffset: (CGFloat)yOffset andWidth: (CGFloat) width andHeight: (CGFloat)height;
- (NSArray *) getArrayWithDimensions;
@end
#endif /* Button_h */
