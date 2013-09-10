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

@property (nonatomic, strong) UIView *borderView;

- (UIColor *)backgroundColorSelected:(BOOL)selected;
- (UIColor *)textColorSelected:(BOOL)selected;
- (UIColor *)borderColor;

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
        
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0.0, 4.0);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.0;
        
        self.borderView = [UIView new];
        [self.contentView addSubview:self.borderView];
        
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
    
    self.borderView.frame = (CGRect){CGPointZero, {2.0, CGRectGetHeight(self.contentView.frame)}};
    
    UIEdgeInsets contentPadding = UIEdgeInsetsMake(1.0, 6.0, 1.0, 4.0);
    CGFloat contentMargin = 2.0;
    CGFloat contentWidth = (CGRectGetWidth(self.contentView.frame) - contentPadding.left - contentPadding.right);
    
    CGSize maxTitleSize = CGSizeMake(contentWidth, CGRectGetHeight(self.contentView.frame) - contentPadding.top - contentPadding.bottom);
    CGSize titleSize = [self.title.text sizeWithFont:self.title.font constrainedToSize:maxTitleSize lineBreakMode:self.title.lineBreakMode];
    CGRect titleFrame = self.title.frame;
    titleFrame.size = titleSize;
    titleFrame.origin.x = contentPadding.left;
    titleFrame.origin.y = contentPadding.top;
    self.title.frame = titleFrame;
    
    CGSize maxLocationSize = CGSizeMake(contentWidth, CGRectGetHeight(self.contentView.frame) - (CGRectGetMaxY(titleFrame) + contentMargin) - contentPadding.bottom);
    CGSize locationSize = [self.location.text sizeWithFont:self.location.font constrainedToSize:maxLocationSize lineBreakMode:self.location.lineBreakMode];
    CGRect locationFrame = self.location.frame;
    locationFrame.size = locationSize;
    locationFrame.origin.x = contentPadding.left;
    locationFrame.origin.y = (CGRectGetMaxY(titleFrame) + contentMargin);
    self.location.frame = locationFrame;
}

#pragma mark - UICollectionViewCell

- (void)setSelected:(BOOL)selected
{
    if (selected && (self.selected != selected)) {
        [UIView animateWithDuration:0.1 animations:^{
            self.transform = CGAffineTransformMakeScale(1.025, 1.025);
            self.layer.shadowOpacity = 0.2;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                self.transform = CGAffineTransformIdentity;
            }];
        }];
    } else if (selected) {
        self.layer.shadowOpacity = 0.2;
    } else {
        self.layer.shadowOpacity = 0.0;
    }
    
    [super setSelected:selected];
    
    [self updateColors];
}

#pragma mark - MSEventCell

- (void)setEvent:(MSEvent *)event
{
    _event = event;
    
    self.title.text = event.title;
    self.location.text = event.location;
    
    [self setNeedsLayout];
}

- (void)updateColors
{
    self.contentView.backgroundColor = [self backgroundColorSelected:self.selected];
    self.borderView.backgroundColor = [self borderColor];
    self.title.textColor = [self textColorSelected:self.selected];
    self.location.textColor = [self textColorSelected:self.selected];
}

- (UIColor *)backgroundColorSelected:(BOOL)selected
{
    return selected ? [UIColor colorWithHexString:@"35b1f1"] : [[UIColor colorWithHexString:@"35b1f1"] colorWithAlphaComponent:0.2];
}

- (UIColor *)textColorSelected:(BOOL)selected
{
    return selected ? [UIColor whiteColor] : [UIColor colorWithHexString:@"21729c"];
}

- (UIColor *)borderColor
{
    return [[self backgroundColorSelected:NO] colorWithAlphaComponent:1.0];
}

@end
