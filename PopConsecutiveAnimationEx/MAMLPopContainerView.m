//
//  MAMLPopContainerView.m
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//

#import "MAMLPopContainerView.h"

typedef NS_ENUM(NSInteger, ViewState) {
    ViewStateOff,
    ViewStateOn
};

@interface MAMLPopContainerView ()

@property (strong, nonatomic) MAMLPopCircle *circle;
@property (strong, nonatomic) MAMLPopLabel  *label;
@property BOOL state;

@end

@implementation MAMLPopContainerView

@synthesize circle, label, state;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        state = ViewStateOff;
        circle = [[MAMLPopCircle alloc] initWithFrame:self.bounds];
        label  = [[MAMLPopLabel alloc] initWithFrame:self.bounds];
        [self addSubview:circle];
        [self addSubview:label];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self toggleState];
}

- (void)toggleState
{
    if (state == ViewStateOff) {
        [circle setState:CircleStateOn];
        [label setState:LabelStateOn];
        state = ViewStateOn;
    } else {
        [circle setState:CircleStateOff];
        [label setState:LabelStateOff];
        state = ViewStateOff;
    }
}

@end
