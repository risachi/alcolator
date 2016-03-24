//
//  ViewController.h
//  alcolator
//
//  Created by Lisa on 3/16/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (void)buttonPressed:(UIButton *)sender;

- (float)alcoholPercentage;
- (float)ouncesPerGlass;
- (NSString *)pluralize:(int)number;
- (NSString *)alcoholName;

@end

