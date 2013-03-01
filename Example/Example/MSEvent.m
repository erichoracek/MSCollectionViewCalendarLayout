//
//  MSEvent.m
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSEvent.h"

@implementation MSEvent

@dynamic remoteID;
@dynamic start;
@dynamic title;
@dynamic location;
@dynamic dateToBeDecided;
@dynamic timeToBeDecided;

- (NSDate *)day
{
    return [self.start beginningOfDay];
}

@end
