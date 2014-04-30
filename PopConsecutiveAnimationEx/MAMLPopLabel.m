//
//  MAMLPopLabel.m
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//

#import "MAMLPopLabel.h"

@interface MAMLPopLabel ()

@property (nonatomic) UIColor  *offColor;
@property (nonatomic) NSString *offText;
@property (nonatomic) UIColor  *onColor;
@property (nonatomic) NSString *onText;

@end

@implementation MAMLPopLabel

@synthesize offColor, offText, onColor, onText, state;

- (id)initWithFrame:(CGRect)frame OnColor:(UIColor *)_onColor OffColor:(UIColor *)_offColor OnText:(NSString *)_onText OffText:(NSString *)_offText
{
    self = [super initWithFrame:frame];
    if (self) {
        onText = _onText;
        offText = _offText;
        onColor = _onColor;
        offColor = _offColor;
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
            self.text = onText;
            self.textColor = onColor;
            break;
            
        default:
            self.text = offText;
            self.textColor = offColor;
            break;
    }
}

@end
