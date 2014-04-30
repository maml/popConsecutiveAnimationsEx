//
//  MAMLPopContainerView.h
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//
//  This view's responsible for
//  - being an overall container for our circle view and label
//  - keeping track of two states, on and off
//  - setting state on circle view and label when it changes
//
//  This class should be set as the custom class to a UIView on your storyboard who's dimensions are square.

#import <UIKit/UIKit.h>
#import "MAMLPopCircle.h"
#import "MAMLPopLabel.h"

@interface MAMLPopContainerView : UIView ; @end
