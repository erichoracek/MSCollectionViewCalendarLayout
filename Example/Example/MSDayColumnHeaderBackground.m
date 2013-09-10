//
//  MSDayColumnHeaderBackground.m
//  Example
//
//  Created by Eric Horacek on 2/28/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSDayColumnHeaderBackground.h"

@interface MSDayColumnHeaderBackground ()

@property (nonatomic, strong) UIToolbar *toolbar;

@end

@implementation MSDayColumnHeaderBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Easy blurring
        self.toolbar = [[UIToolbar alloc] initWithFrame:frame];
        self.toolbar.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        self.layer.masksToBounds = YES;
        [self addSubview:self.toolbar];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.toolbar.frame = (CGRect){CGPointZero, self.frame.size};
}

@end
