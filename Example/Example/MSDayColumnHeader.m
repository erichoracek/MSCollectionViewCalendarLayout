//
//  MSDayColumnHeader.m
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSDayColumnHeader.h"

@implementation MSDayColumnHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.title = [UILabel new];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.shadowColor = [UIColor whiteColor];
        self.title.shadowOffset = CGSizeMake(0.0, 1.0);
        [self addSubview:self.title];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.title sizeToFit];
    CGRect titleFrame = self.title.frame;
    titleFrame.origin.x = nearbyintf((CGRectGetWidth(self.frame) / 2.0) - (CGRectGetWidth(titleFrame) / 2.0));
    titleFrame.origin.y = nearbyintf((CGRectGetHeight(self.frame) / 2.0) - (CGRectGetHeight(titleFrame) / 2.0));
    self.title.frame = titleFrame;
}

- (void)setDay:(NSDate *)day
{
    _day = day;
    
    if ([[day beginningOfDay] isEqualToDate:[[NSDate date] beginningOfDay]]) {
        self.title.textColor = [UIColor colorWithHexString:@"3e77e3"];
    } else {
        self.backgroundColor = [UIColor clearColor];
        self.title.textColor = [UIColor colorWithHexString:@"918c8c"];
    }
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"EEEE, MMM d";
    self.title.text = [dateFormatter stringFromDate:day];
    [self setNeedsLayout];
}

@end
