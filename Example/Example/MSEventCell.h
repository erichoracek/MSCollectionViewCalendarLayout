//
//  MSEventCell.h
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSEvent;

@interface MSEventCell : UICollectionViewCell

@property (nonatomic, weak) MSEvent *event;

@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *location;

@end
