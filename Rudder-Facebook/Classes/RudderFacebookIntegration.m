//
//  RudderFacebookIntegration.m
//  FBSnapshotTestCase
//
//  Created by Arnab Pal on 15/11/19.
//

#import "RudderFacebookIntegration.h"

@implementation RudderFacebookIntegration

- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RudderClient *)client {
    if (self == [super init]) {
        _config = config;
        _client = client;
        
        NSString *applicationID = [config objectForKey:@"apiKey"];
        
        if (applicationID != nil) {
            [FBSDKSettings setAppID:applicationID];
            [FBSDKSettings setAutoInitEnabled:YES];
            [FBSDKSettings setAutoLogAppEventsEnabled:YES];
            [FBSDKApplicationDelegate initializeSDK:nil];
            [FBSDKSettings setAdvertiserIDCollectionEnabled:YES];
            [FBSDKAppEvents activateApp];
        }else {
            [RudderLogger logError:@"Facebook Factory is not initialized"];
        }
    }
    return self;
}

- (void) processRuderEvent: (nonnull RudderMessage *) message {
    NSString *type = message.type;
    if ([type isEqualToString:@"identify"]) {
        [FBSDKAppEvents setUserID:message.userId];
        NSDictionary *address = (NSDictionary*) message.context.traits[@"address"];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", message.context.traits[@"email"]] forType:FBSDKAppEventEmail];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", message.context.traits[@"firstName"]] forType:FBSDKAppEventFirstName];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", message.context.traits[@"lastName"]] forType:FBSDKAppEventLastName];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", message.context.traits[@"phone"]] forType:FBSDKAppEventPhone];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", message.context.traits[@"birthday"]] forType:FBSDKAppEventDateOfBirth];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", message.context.traits[@"gender"]] forType:FBSDKAppEventGender];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", address[@"city"]] forType:FBSDKAppEventCity];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", address[@"state"]] forType:FBSDKAppEventState];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", address[@"postalcode"]] forType:FBSDKAppEventZip];
        [FBSDKAppEvents setUserData:[[NSString alloc] initWithFormat:@"%@", address[@"country"]] forType:FBSDKAppEventCountry];
    } else if ([type isEqualToString:@"track"] || [type isEqualToString:@"screen"]) {
        [FBSDKAppEvents logEvent:message.event parameters:message.properties];
    } else {
        [RudderLogger logWarn:@"MessageType is not supported"];
    }
}

- (void)dump:(nonnull RudderMessage *)message {
    [self processRuderEvent:message];
    
}

- (void)reset {
    [FBSDKAppEvents clearUserID];
    [FBSDKAppEvents clearUserData];
}


@end
