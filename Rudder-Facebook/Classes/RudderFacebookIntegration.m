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
        }
    }
    return self;
}

- (void)dump:(nonnull RudderMessage *)message {
    [FBSDKAppEvents logEvent:message.event parameters:message.properties];
}

@end
