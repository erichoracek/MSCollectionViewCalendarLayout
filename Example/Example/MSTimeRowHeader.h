//
//  MSTimeRowHeader.h
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTimeRowHeader : UICollectionReusableView

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) NSDate *time;

@end
