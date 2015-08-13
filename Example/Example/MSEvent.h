//
//  MSEvent.h
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSEvent : NSManagedObject

@property (nonatomic, strong) NSNumber *remoteID;
@property (nonatomic, strong) NSDate *start;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSNumber *timeToBeDecided;
@property (nonatomic, strong) NSNumber *dateToBeDecided;

- (NSDate *)day; // Derived attribute to make it easy to sort events into days by equality

@end
