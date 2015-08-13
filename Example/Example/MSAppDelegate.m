//
//  MSAppDelegate.m
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

#import "MSAppDelegate.h"
#import "MSCalendarViewController.h"
#import "MSEvent.h"

@interface MSAppDelegate ()

- (void)setupRestKitWithBaseURL:(NSURL *)baseURL;

@end

@implementation MSAppDelegate

- (void)setupRestKitWithBaseURL:(NSURL *)baseURL
{
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
    
    // Initialize managed object store
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    objectManager.managedObjectStore = managedObjectStore;
    
    NSEntityDescription *entity = [[managedObjectStore.managedObjectModel entitiesByName] objectForKey:@"Event"];
    RKEntityMapping *eventMapping = [[RKEntityMapping alloc] initWithEntity:entity];
    [eventMapping addAttributeMappingsFromArray:@[ @"title" ]];
    [eventMapping addAttributeMappingsFromDictionary:@{
        @"id" : @"remoteID",
        @"date_tbd" : @"dateToBeDecided",
        @"time_tbd" : @"timeToBeDecided",
        @"datetime_utc" : @"start",
        @"venue.name" : @"location"
     }];
    
    RKResponseDescriptor *eventIndexResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:eventMapping method:RKRequestMethodGET pathPattern:@"events" keyPath:@"events" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [objectManager addResponseDescriptor:eventIndexResponseDescriptor];
    
    [objectManager addFetchRequestBlock:^NSFetchRequest *(NSURL *URL) {
        RKPathMatcher *pathMatcher = [RKPathMatcher pathMatcherWithPattern:@"events"];
        NSDictionary *argsDict = nil;
        BOOL match = [pathMatcher matchesPath:[URL relativePath] tokenizeQueryStrings:NO parsedArguments:&argsDict];
        if (match) {
            return [NSFetchRequest fetchRequestWithEntityName:@"Event"];
        }
        return nil;
    }];
    
    [managedObjectStore createPersistentStoreCoordinator];
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"Example.sqlite"];
    [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:nil];
    [managedObjectStore createManagedObjectContexts];
    managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupRestKitWithBaseURL:[NSURL URLWithString:@"http://api.seatgeek.com/2/"]];
    
    MSCalendarViewController *calendarViewController = [[MSCalendarViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = calendarViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
