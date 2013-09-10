//
//  MSDayColumnHeaderBackground.m
//  Example
//
//  Created by Eric Horacek on 2/28/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSDayColumnHeaderBackground.h"

@implementation MSDayColumnHeaderBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"f7f7f7"];
    }
    return self;
}

@end
