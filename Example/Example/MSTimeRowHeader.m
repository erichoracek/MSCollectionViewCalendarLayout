//
//  MSTimeRowHeader.m
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

#import "MSTimeRowHeader.h"

@implementation MSTimeRowHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.title = [UILabel new];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:self.title];
        
        [self.title makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.right.equalTo(self.right).offset(-5.0);
        }];
    }
    return self;
}

#pragma mark - MSTimeRowHeader

- (void)setTime:(NSDate *)time
{
    _time = time;
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"h a";
    }
    self.title.text = [dateFormatter stringFromDate:time];
    [self setNeedsLayout];
}

@end
