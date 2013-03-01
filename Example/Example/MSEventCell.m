//
//  MSEventCell.m
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSEventCell.h"
#import "MSEvent.h"

@interface MSEventCell ()

- (UIColor *)cellBackgroundColorSelected:(BOOL)selected;
- (UIColor *)cellTextColorSelected:(BOOL)selected;
- (UIColor *)cellBorderColorSelected:(BOOL)selected;
- (UIColor *)cellTextShadowColorSelected:(BOOL)selected;
- (CGSize)cellTextShadowOffsetSelected:(BOOL)selected;

- (void)updateColors;

@end

@implementation MSEventCell

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        self.layer.shouldRasterize = YES;
        
        self.contentView.layer.borderWidth = 1.0;
        self.contentView.layer.cornerRadius = 4.0;
        self.contentView.layer.masksToBounds = YES;
        
        self.time = [UILabel new];
        self.time.backgroundColor = [UIColor clearColor];
        self.time.numberOfLines = 0;
        self.time.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:self.time];
        
        self.title = [UILabel new];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.numberOfLines = 0;
        self.title.font = [UIFont boldSystemFontOfSize:12.0];
        [self.contentView addSubview:self.title];
        
        self.location = [UILabel new];
        self.location.backgroundColor = [UIColor clearColor];
        self.location.numberOfLines = 0;
        self.location.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:self.location];
        
        [self updateColors];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(4.0, 5.0, 4.0, 5.0);
    CGFloat contentMargin = 2.0;
    CGFloat contentWidth = (CGRectGetWidth(self.contentView.frame) - padding.left - padding.right);
    
    CGSize maxTimeSize = CGSizeMake(contentWidth, CGRectGetHeight(self.contentView.frame) - padding.top - padding.bottom);
    CGSize timeSize = [self.time.text sizeWithFont:self.time.font constrainedToSize:maxTimeSize lineBreakMode:self.time.lineBreakMode];
    CGRect timeFrame = self.time.frame;
    timeFrame.size = timeSize;
    timeFrame.origin.x = padding.left;
    timeFrame.origin.y = padding.top;
    self.time.frame = timeFrame;
        
    CGSize maxTitleSize = CGSizeMake(contentWidth, CGRectGetHeight(self.contentView.frame) - (CGRectGetMaxY(timeFrame) + contentMargin) - padding.bottom);
    CGSize titleSize = [self.title.text sizeWithFont:self.title.font constrainedToSize:maxTitleSize lineBreakMode:self.title.lineBreakMode];
    CGRect titleFrame = self.title.frame;
    titleFrame.size = titleSize;
    titleFrame.origin.x = padding.left;
    titleFrame.origin.y = (CGRectGetMaxY(timeFrame) + contentMargin);
    self.title.frame = titleFrame;
    
    CGSize maxLocationSize = CGSizeMake(contentWidth, CGRectGetHeight(self.contentView.frame) - (CGRectGetMaxY(titleFrame) + contentMargin) - padding.bottom);
    CGSize locationSize = [self.location.text sizeWithFont:self.location.font constrainedToSize:maxLocationSize lineBreakMode:self.location.lineBreakMode];
    CGRect locationFrame = self.location.frame;
    locationFrame.size = locationSize;
    locationFrame.origin.x = padding.left;
    locationFrame.origin.y = (CGRectGetMaxY(titleFrame) + contentMargin);
    self.location.frame = locationFrame;
}

#pragma mark - UICollectionViewCell

- (void)setSelected:(BOOL)selected
{
    if (selected && self.selected != selected) {
        [UIView animateWithDuration:0.1 animations:^{
            self.transform = CGAffineTransformMakeScale(1.05, 1.05);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                self.transform = CGAffineTransformIdentity;
            }];
        }];
    }
    
    [super setSelected:selected];
    
    [self updateColors];
}

#pragma mark - MSEventCell

- (void)setEvent:(MSEvent *)event
{
    _event = event;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"h:mm a";
    
    self.time.text = [dateFormatter stringFromDate:event.start];
    self.title.text = event.title;
    self.location.text = event.location;
    
    [self setNeedsLayout];
}

- (void)updateColors
{
    self.contentView.backgroundColor = [self cellBackgroundColorSelected:self.selected];
    self.contentView.layer.borderColor = [[self cellBorderColorSelected:self.selected] CGColor];
    
    self.time.textColor = [self cellTextColorSelected:self.selected];
    self.time.shadowColor = [self cellTextShadowColorSelected:self.selected];
    self.time.shadowOffset = [self cellTextShadowOffsetSelected:self.selected];
    
    self.title.textColor = [self cellTextColorSelected:self.selected];
    self.title.shadowColor = [self cellTextShadowColorSelected:self.selected];
    self.title.shadowOffset = [self cellTextShadowOffsetSelected:self.selected];
    
    self.location.textColor = [self cellTextColorSelected:self.selected];
    self.location.shadowColor = [self cellTextShadowColorSelected:self.selected];
    self.location.shadowOffset = [self cellTextShadowOffsetSelected:self.selected];
}

- (UIColor *)cellBackgroundColorSelected:(BOOL)selected
{
    return selected ? [[UIColor colorWithHexString:@"165b9b"] colorWithAlphaComponent:0.8] : [[UIColor colorWithHexString:@"b4d0ea"] colorWithAlphaComponent:0.8];
}

- (UIColor *)cellTextColorSelected:(BOOL)selected
{
    return selected ? [UIColor whiteColor] : [UIColor colorWithHexString:@"2b77ad"];
}

- (UIColor *)cellBorderColorSelected:(BOOL)selected
{
    return selected ? [UIColor colorWithHexString:@"0c2e4d"] : [UIColor colorWithHexString:@"2b77ad"];
}

- (UIColor *)cellTextShadowColorSelected:(BOOL)selected
{
    return selected ? [[UIColor blackColor] colorWithAlphaComponent:0.5] : [[UIColor whiteColor] colorWithAlphaComponent:0.5];
}

- (CGSize)cellTextShadowOffsetSelected:(BOOL)selected
{
    return selected ? CGSizeMake(0.0, -1.0) : CGSizeMake(0.0, 1.0);
}

@end
