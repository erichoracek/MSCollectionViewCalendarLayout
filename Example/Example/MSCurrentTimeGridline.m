//
//  MSCurrentTimeGridline.m
//  Example
//
//  Created by Eric Horacek on 2/27/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSCurrentTimeGridline.h"

@implementation MSCurrentTimeGridline

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"a1a1a1"];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:CGRectInset(frame, -10.0, 0.0)];
}

@end
