//
//  ViewController.h
//  Calculator
//
//  Created by Sebastian Servin on 1/6/22.
//

#import <UIKit/UIKit.h>
#import "Math.h"

@interface ViewController : UIViewController

@property Math *math;
@property UILabel *label;
@property NSString *currentState;
@property NSString *pastText;
@property NSNumberFormatter *numberFormatter;

@end

