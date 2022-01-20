//
//  ViewController.m
//  Calculator
//
//  Created by Sebastian Servin on 1/6/22.
//

#import "ViewController.h"
#import "Button.h"
//#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addLabel];
    [self addButtons];
    self.math = [[Math alloc] init];
    self.currentState = @"";
    self.pastText = @"";
    self.numberFormatter = [[NSNumberFormatter alloc] init];
    self.numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
}

- (void)addLabel {
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat width = size.width;
    CGFloat height = size.height / 3;
    CGRect frame = CGRectMake(0, 0, width, height);
    self.label = [[UILabel alloc] initWithFrame:frame];
    self.label.backgroundColor = UIColor.whiteColor;
    self.label.textColor = UIColor.blackColor;
    self.label.text = @"";
    self.label.textAlignment = NSTextAlignmentRight;
    self.label.font = [UIFont systemFontOfSize:60.0];
    self.label.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.label];
}

- (void)addButtons {
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    CGFloat topPadding = window.safeAreaInsets.top;
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    CGFloat areaHeight = (size.height / 4) + topPadding;
    
    // Arrays = [text, x, y, width, height]
    CGFloat xOffset = 0.0;
    CGFloat yOffset = (size.height / 4) + topPadding;
    CGFloat width = size.width / 4;
    CGFloat height = ((size.height / 4) * 3) / 6;

    // First row
    Button *ac = [[Button alloc] initWithDimensions:@"AC" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[ac getArrayWithDimensions]];
    
    xOffset = width * 1;
    Button *plusMinus = [[Button alloc] initWithDimensions:@"+/-" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[plusMinus getArrayWithDimensions]];
    
    xOffset = width * 2;
    Button *percent = [[Button alloc] initWithDimensions:@"%" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[percent getArrayWithDimensions]];
    
    xOffset = width * 3;
    Button *division = [[Button alloc] initWithDimensions:@"/" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[division getArrayWithDimensions]];
    
    // Second row
    yOffset = areaHeight + (height * 1);
    
    xOffset = width * 0;
    Button *seven = [[Button alloc] initWithDimensions:@"7" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[seven getArrayWithDimensions]];
    
    xOffset = width * 1;
    Button *eight = [[Button alloc] initWithDimensions:@"8" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[eight getArrayWithDimensions]];
    
    xOffset = width * 2;
    Button *nine = [[Button alloc] initWithDimensions:@"9" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[nine getArrayWithDimensions]];
    
    xOffset = width * 3;
    Button *multiplication = [[Button alloc] initWithDimensions:@"X" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[multiplication getArrayWithDimensions]];
    
    // Third row
    yOffset = areaHeight + (height * 2);
    
    xOffset = width * 0;
    Button *four = [[Button alloc] initWithDimensions:@"4" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[four getArrayWithDimensions]];
    
    xOffset = width * 1;
    Button *five = [[Button alloc] initWithDimensions:@"5" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[five getArrayWithDimensions]];
    
    xOffset = width * 2;
    Button *six = [[Button alloc] initWithDimensions:@"6" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[six getArrayWithDimensions]];
    
    xOffset = width * 3;
    Button *minus = [[Button alloc] initWithDimensions:@"-" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[minus getArrayWithDimensions]];
    
    // Fourth row
    yOffset = areaHeight + (height * 3);
    
    xOffset = width * 0;
    Button *one = [[Button alloc] initWithDimensions:@"1" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[one getArrayWithDimensions]];
    
    xOffset = width * 1;
    Button *two = [[Button alloc] initWithDimensions:@"2" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[two getArrayWithDimensions]];
    
    xOffset = width * 2;
    Button *three = [[Button alloc] initWithDimensions:@"3" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[three getArrayWithDimensions]];
    
    xOffset = width * 3;
    Button *plus = [[Button alloc] initWithDimensions:@"+" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[plus getArrayWithDimensions]];
    
    // Fourth row
    yOffset = areaHeight + (height * 4);
    
    xOffset = width * 0;
    Button *zero = [[Button alloc] initWithDimensions:@"0" andXOffset:xOffset andYOffset:yOffset andWidth:(width * 2) andHeight:height];
    [buttons addObject:[zero getArrayWithDimensions]];
    
    xOffset = width * 2;
    Button *period = [[Button alloc] initWithDimensions:@"." andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[period getArrayWithDimensions]];
    
    xOffset = width * 3;
    Button *equal = [[Button alloc] initWithDimensions:@"=" andXOffset:xOffset andYOffset:yOffset andWidth:width andHeight:height];
    [buttons addObject:[equal getArrayWithDimensions]];
    
    for (NSInteger i = 0; i < buttons.count; i++) {
        NSString *text = [buttons objectAtIndex:i][0];
        NSNumber *x = [buttons objectAtIndex:i][1];
        NSNumber *y = [buttons objectAtIndex:i][2];
        NSNumber *width = [buttons objectAtIndex:i][3];
        NSNumber *height = [buttons objectAtIndex:i][4];
        CGRect frame = CGRectMake([x floatValue], [y floatValue], [width floatValue], [height floatValue]);
        UIButton *button = [[UIButton alloc] initWithFrame:frame];
        [button setTitle:text forState:UIControlStateNormal];
        button.accessibilityLabel = text;
        button.backgroundColor = UIColor.redColor;
        button.layer.borderWidth = 3;
        button.layer.borderColor = UIColor.blackColor.CGColor;
        [button addTarget:self action:@selector(onButtonClicked:) forControlEvents: UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void) onButtonClicked: (UIButton *) sender {
    NSString *buttonText = sender.accessibilityLabel;
    
    if ([buttonText isEqualToString:@"+"]) {
        self.currentState = @"+";
        self.pastText = self.label.text;
        self.label.text = @"";
    } else if ([buttonText isEqualToString:@"-"]) {
        self.currentState = @"-";
        self.pastText = self.label.text;
        self.label.text = @"";
    } else if ([buttonText isEqualToString:@"/"]) {
        self.currentState = @"/";
        self.pastText = self.label.text;
        self.label.text = @"";
    } else if ([buttonText isEqualToString:@"X"]) {
        self.currentState = @"X";
        self.pastText = self.label.text;
        self.label.text = @"";
    } else if ([buttonText isEqualToString:@"="]) {
        [self onEqualPressed];
        self.currentState = @"";
    } else if ([buttonText isEqualToString:@"AC"]) {
        self.currentState = @"";
        self.pastText = @"";
        [self.label setText:@""];
    } else {
        NSString *temp = [self.label.text stringByAppendingString:buttonText];
        [self.label setText:temp];
    }
}

- (void) onEqualPressed {
    NSNumber *temp;
    if ([self.currentState isEqualToString:@"+"]) {
        temp = [self.math add:[self.numberFormatter numberFromString:self.pastText] andNumberTwo:[self.numberFormatter numberFromString:self.label.text]];
    } else if ([self.currentState isEqualToString:@"-"]) {
        temp = [self.math subtract:[self.numberFormatter numberFromString:self.pastText] andNumberTwo:[self.numberFormatter numberFromString:self.label.text]];
    } else if ([self.currentState isEqualToString:@"X"]) {
        temp = [self.math multiply:[self.numberFormatter numberFromString:self.pastText] andNumberTwo:[self.numberFormatter numberFromString:self.label.text]];
    } else if ([self.currentState isEqualToString:@"/"]) {
        temp = [self.math divide:[self.numberFormatter numberFromString:self.pastText] andNumberTwo:[self.numberFormatter numberFromString:self.label.text]];
    }
//    NSLog(@"%@", [temp stringValue]);
    [self.label setText:[temp stringValue]];
}
@end
