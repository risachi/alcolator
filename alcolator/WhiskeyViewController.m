//
//  WhiskeyViewController.m
//  alcolator
//
//  Created by Lisa on 3/17/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

- (float)alcoholPercentage {
    return 0.4f;
}

- (float)ouncesPerGlass {
    return 1;
}

- (NSString *)pluralize:(int)number {
    return number ==1 ? NSLocalizedString(@"shot", @"singular shot") : NSLocalizedString(@"shots", @"plural of shot");
}

- (NSString *)alcoholName {
    return @"whiskey";
}

@end
