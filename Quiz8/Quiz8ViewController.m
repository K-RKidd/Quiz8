//
//  Quiz8ViewController.m
//  Quiz8
//
//  Created by Krystle on 4/11/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "Quiz8ViewController.h"


@interface Quiz8ViewController ()

@end

@implementation Quiz8ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    lastVelocity = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addHorizontal:(id)sender {
    
    UIRotationGestureRecognizer *s = sender;
    if (lastVelocity > 0 && s.velocity < 0){
        [self.esView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0){
        [self.esView saveCurrentPoint];
    }
    [self.esView setCurrentHorizontalAngle:s.rotation];
    [self.esView setCurrentVelocity: s.velocity];
    if (s.state == UIGestureRecognizerStateEnded){
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
    
    
}

- (IBAction)addVertical:(id)sender {
    UIRotationGestureRecognizer *s = sender;
    if (lastVelocity > 0 && s.velocity < 0){
        [self.esView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0){
        [self.esView saveCurrentPoint];
    }
    [self.esView setCurrentVerticalAngle:s.rotation];
    [self.esView setCurrentVelocity: s.velocity];
    if (s.state == UIGestureRecognizerStateEnded){
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
    
    
}
@end
