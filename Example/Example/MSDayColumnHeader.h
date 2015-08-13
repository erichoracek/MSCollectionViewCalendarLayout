//
//  MSDayColumnHeader.h
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSDayColumnHeader : UICollectionReusableView

@property (nonatomic, strong) NSDate *day;
@property (nonatomic, assign) BOOL currentDay;

@end
