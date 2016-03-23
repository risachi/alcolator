//
//  ViewController.m
//  alcolator
//
//  Created by Lisa on 3/16/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float)alcoholPercentage {
    return 0.13f;
}

- (float)ouncesPerGlass {
    return 5;
}

- (NSString *)pluralize:(int)number {
    return number == 1 ? NSLocalizedString(@"glass", @"singular glass") : NSLocalizedString(@"glasses", @"plural of glass");
}

- (NSString *)alcoholName {
    return @"wine";
}

- (void)recalculate {
    [self.beerPercentTextField resignFirstResponder];
    // first, calculate how much alcohol is in all those beers...
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    // now, calculate the equivalent amount of wine...
    float ouncesInOneWineGlass = [self ouncesPerGlass];  // wine glasses are usually 5oz
    float alcoholPercentageOfWine = [self alcoholPercentage];  // 13% is average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *wineText = [self pluralize:numberOfWineGlassesForEquivalentAlcoholAmount];
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of %@.", nil), numberOfBeers, beerText,  [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, wineText, [self alcoholName]];
    NSString *navResultText = [NSString stringWithFormat:NSLocalizedString(@"%@ (%.1f %@)", nil), [self alcoholName], numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    
    self.resultLabel.text = resultText;
    self.navigationItem.title = navResultText;
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    }
    [self recalculate];
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    
    [self.beerPercentTextField resignFirstResponder];
    
    [self recalculate];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self recalculate];
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end
