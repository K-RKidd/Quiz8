//
//  Quiz8ViewController.h
//  Quiz8
//
//  Created by Krystle on 4/11/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESView.h"

@interface Quiz8ViewController : UIViewController {
    CGFloat lastVelocity;
    
    
}

@property (weak, nonatomic) IBOutlet ESView *esView;

- (IBAction)addHorizontal:(id)sender;
- (IBAction)addVertical:(id)sender;


@end
