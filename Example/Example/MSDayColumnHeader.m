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
        self.title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.title];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.title sizeToFit];
    CGRect titleFrame = self.title.frame;
    titleFrame.size.width += 18.0;
    titleFrame.size.height += 6.0;
    titleFrame.origin.x = nearbyintf((CGRectGetWidth(self.frame) / 2.0) - (CGRectGetWidth(titleFrame) / 2.0));
    titleFrame.origin.y = nearbyintf((CGRectGetHeight(self.frame) / 2.0) - (CGRectGetHeight(titleFrame) / 2.0));
    self.title.frame = titleFrame;
    
    self.title.layer.cornerRadius = nearbyintf(CGRectGetHeight(titleFrame) / 2.0);
}

- (void)setDay:(NSDate *)day
{
    _day = day;
    
    if ([[day beginningOfDay] isEqualToDate:[[NSDate date] beginningOfDay]]) {
        self.title.textColor = [UIColor colorWithHexString:@"ffffff"];
        self.title.font = [UIFont boldSystemFontOfSize:16.0];
        self.title.backgroundColor = [UIColor colorWithHexString:@"35b1f1"];
    } else {
        self.title.font = [UIFont systemFontOfSize:16.0];
        self.title.textColor = [UIColor colorWithHexString:@"b8b8b8"];
        self.title.backgroundColor = [UIColor clearColor];
    }
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"EEEE MMMM d, YYYY";
    }
    self.title.text = [dateFormatter stringFromDate:day];
    [self setNeedsLayout];
}

@end
