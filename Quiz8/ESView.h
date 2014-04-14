//
//  ESView.h
//  Quiz8
//
//  Created by Krystle on 4/11/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESView :UIView
{
    NSMutableArray *points;
}
@property (nonatomic) CGPoint currentPoint;
-(void)saveCurrentPoint;

@property (nonatomic) CGFloat CurrentHorizontalAngle;
@property (nonatomic) CGFloat CurrentVelocity;
@property (nonatomic) CGFloat CurrentVerticalAngle;

@end
