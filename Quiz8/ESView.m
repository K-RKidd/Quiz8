//
//  ESView.m
//  Quiz8
//
//  Created by Krystle on 4/11/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "ESView.h"

@implementation ESView
@synthesize currentPoint;
@synthesize CurrentHorizontalAngle = _CurrentHorizontalAngle;
@synthesize CurrentVerticalAngle = _CurrentVerticalAngle;
@synthesize  CurrentVelocity = _CurrentVelocity;

-(void) setCurrentVerticalAngle:(CGFloat)CurrentVerticalAngle{
    _CurrentVerticalAngle = CurrentVerticalAngle;
    [self setNeedsDisplay];
}
-(void) setCurrentVelocity:(CGFloat)CurrentVelocity{
    if (CurrentVelocity >0 && _CurrentVelocity <0){
        [self saveCurrentPoint];
    }
    if (CurrentVelocity < 0 && _CurrentVelocity > 0){
        [self saveCurrentPoint];
    }
    _CurrentVelocity = CurrentVelocity;
}
-(void)setCurrentHorizontalAngle:(CGFloat)CurrentHorizontalAngle{
    _CurrentHorizontalAngle = CurrentHorizontalAngle;
    [self setNeedsDisplay];
}
/// Intialize points array
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        points = [[NSMutableArray alloc]init];
        ///start point
        NSValue *p = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
        [points addObject:p];
    }
    return self;
}

///Detect shakes to erase
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (event.subtype == UIEventSubtypeMotionShake){
        
        [points removeAllObjects];
        [points addObject:[NSValue valueWithCGPoint:currentPoint]];
        [self setNeedsDisplay];
    }
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)])
        [super motionEnded:motion withEvent:event];
}
-(void)saveCurrentPoint{
    NSValue *p = [NSValue valueWithCGPoint:currentPoint];
    [points addObject:p];
    self.CurrentVerticalAngle = 0;
    self.CurrentHorizontalAngle = 0;
    self.CurrentVelocity = 0;
    
    
}
-(void) drawRect:(CGRect)rect{
    UIBezierPath *bz = [[UIBezierPath alloc]init];
    [bz setLineWidth:4];
    [[UIColor blackColor]setStroke];
    [bz moveToPoint:[[points firstObject] CGPointValue]];
    for (id p in points){
        [bz addLineToPoint:[p CGPointValue]];
    }
    CGPoint lastPoint = [[points lastObject ]CGPointValue];
    currentPoint = CGPointMake(lastPoint.x + self.CurrentHorizontalAngle*10.0 , lastPoint.y + self.CurrentVerticalAngle*10.0);
    if (currentPoint.x < 0){
        currentPoint.x = 0;
    }
    if (currentPoint.y < 0){
        currentPoint.y = 0;
    }
    if (currentPoint.x > self.bounds.size.width){
        currentPoint.x = self.bounds.size.width;
    }
    if (currentPoint.y > self.bounds.size.height){
        currentPoint.y = self.bounds.size.height;
    }
    [bz addLineToPoint:currentPoint];
    [self saveCurrentPoint];
    [bz stroke];
    [self drawCurrentPoint];
}
-(void) drawCurrentPoint{
    [[UIColor whiteColor]setStroke];
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:currentPoint];
    [path setLineWidth:4];
    CGPoint p = CGPointMake(currentPoint.x-2, currentPoint.y-2);
    [path addLineToPoint:p];
    p.x += 4.0;
    [path addLineToPoint:p];
    p.y += 4.0;
    [path addLineToPoint:p];
    p.x -= 4.0;
    [path addLineToPoint:p];
    [path stroke];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        points = [[NSMutableArray alloc] init];
        [points addObject:[NSValue valueWithCGPoint:CGPointMake(140, 190)]];
    }
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [self becomeFirstResponder];
    return self;
}
-(BOOL) canBecomeFirstResponder {
    return YES;
}

@end
