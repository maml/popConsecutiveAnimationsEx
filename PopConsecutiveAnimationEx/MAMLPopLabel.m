//
//  MAMLPopLabel.m
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//

#import "MAMLPopLabel.h"

@implementation MAMLPopLabel

@synthesize state;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.text = @"Off";
        self.textColor = [UIColor lightGrayColor];
        self.font = [UIFont systemFontOfSize:12];
        self.textAlignment = NSTextAlignmentCenter;
        [self addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:Nil];
    }
    return self;
}

#pragma mark KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"state"]) {
        LabelState newState = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
        [self handleChangeToState:newState];
    }
}

- (void)handleChangeToState:(LabelState)_state
{
    switch (_state) {
        case LabelStateOn:
            self.text = @"On";
            self.textColor = [UIColor greenColor];
            break;
            
        default:
            self.text = @"Off";
            self.textColor = [UIColor lightGrayColor];
            break;
    }
}

@end
