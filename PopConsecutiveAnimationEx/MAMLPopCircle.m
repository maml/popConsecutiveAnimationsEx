//
//  MAMLPopCircle.m
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//

#import "MAMLPopCircle.h"

@interface MAMLPopCircle ()

@property BOOL needToPopIn;
@property BOOL needToRemoveAnimation;
@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@property (nonatomic) UIColor  *offColor;
@property (nonatomic) UIColor  *onColor;

@end

@implementation MAMLPopCircle

@synthesize needToPopIn, needToRemoveAnimation, offColor, onColor, shapeLayer, state;

- (id)initWithFrame:(CGRect)frame OnColor:(UIColor *)_onColor OffColor:(UIColor *)_offColor;
{
    self = [super initWithFrame:frame];
    if (self) {
        onColor = _onColor;
        offColor = _offColor;
        
        // Sets up the circle with respect to the frame within which it's initialized
        shapeLayer = [CAShapeLayer layer];
        shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
        shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        
        CGFloat midX = CGRectGetMidX(self.bounds);
        CGFloat midY = CGRectGetMidY(self.bounds);
        CGPoint center = CGPointMake(midX, midY);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:self.bounds.size.width/2
                                                        startAngle:0
                                                          endAngle:(2 * M_PI)
                                                         clockwise:YES];
        [path closePath];
        shapeLayer.path = path.CGPath;
        [self.layer addSublayer:shapeLayer];
        
        [self addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:Nil];
        
        needToPopIn = YES;
        needToRemoveAnimation = NO;
    }
    return self;
}

#pragma mark KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"state"]) {
        CircleState newState = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
        [self handleChangeToState:newState];
    }
}

- (void)handleChangeToState:(CircleState)_state
{
    switch (_state) {
        case CircleStateOn:
            shapeLayer.strokeColor = [onColor CGColor];
            [self popOut];
            break;
            
        default:
            shapeLayer.strokeColor = [offColor CGColor];
            [self popOut];
            break;
    }
}

#pragma mark POPAnimations

- (void)popOut
{
    POPSpringAnimation *animV = [POPSpringAnimation animation];
    animV.delegate = self;
    animV.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    animV.toValue = [NSValue valueWithCGSize:CGSizeMake(1.4, 1.4)];
    animV.springSpeed = 20.0;
    [self pop_addAnimation:animV forKey:@"view"];
}

- (void)popIn
{
    POPSpringAnimation *animV = [POPSpringAnimation animation];
    animV.delegate = self;
    animV.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    animV.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    animV.springBounciness = 10.0;
    animV.springSpeed = 13.0;
    [self pop_addAnimation:animV forKey:@"view"];
    needToPopIn = NO;
}

#pragma mark POPAnimationDelegate

- (void)pop_animationDidReachToValue:(POPAnimation *)anim
{
    if (needToRemoveAnimation) {
        [self pop_removeAnimationForKey:@"view"];
        needToRemoveAnimation = NO;
    }
    if (needToPopIn) {
        [self popIn];
    }
}

- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished
{
    if (finished) {
        needToPopIn = YES;
        needToRemoveAnimation = YES;
    }
}


@end
