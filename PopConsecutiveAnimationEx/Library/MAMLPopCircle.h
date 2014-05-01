//
//  MAMLPopCircle.h
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//
//  This view draws a circle via a UIBezierPath onto a CAShapeLayer and adds it
//  as a sublayer. It has one public property, state, and observes its changes.
//  There are two states, on and off. Each state change triggers a succesive run
//  of two animations and an appropriate strokeFill update.
//
//  The animations are instances of PopSpringAnimation and their running in succession
//  is orchestrated by two booleans
//  - needToPopIn
//  - needToRemoveAnimation
//  and the implementation of two PopAnimationDelegate methods
//  - (void)pop_animationDidReachToValue:anim
//  - (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished

#import <UIKit/UIKit.h>
#import <POP/POP.h>

typedef NS_ENUM(NSInteger, CircleState) {
    CircleStateOff,
    CircleStateOn
};

@interface MAMLPopCircle : UIView <POPAnimationDelegate>

- (id)initWithFrame:(CGRect)frame OnColor:(UIColor *)_onColor OffColor:(UIColor *)_offColor;

@property BOOL state;

@end
