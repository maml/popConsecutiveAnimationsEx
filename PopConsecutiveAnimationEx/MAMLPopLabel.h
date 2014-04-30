//
//  MAMLPopLabel.h
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//
//  This draws a label into the frame within which it was initialized. It has
//  one public property, state, and observes its changes and updates its text
//  and color accordingly.

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LabelState) {
    LabelStateOff,
    LabelStateOn
};

@interface MAMLPopLabel : UILabel

@property BOOL state;

@end
