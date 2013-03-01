//
//  MSCurrentTimeIndicator.m
//  Example
//
//  Created by Eric Horacek on 2/27/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSCurrentTimeIndicator.h"

@interface MSCurrentTimeIndicator()

@property (nonatomic, strong) UIImageView *backgroundImage;

@end

@implementation MSCurrentTimeIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MSCurrentTimeIndicator"]];
        [self addSubview:self.backgroundImage];
    }
    return self;
}

@end
