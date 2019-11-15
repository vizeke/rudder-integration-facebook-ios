//
//  RudderFacebookIntegration.h
//  FBSnapshotTestCase
//
//  Created by Arnab Pal on 15/11/19.
//

#import <Foundation/Foundation.h>
#import "RudderIntegration.h"
#import "RudderClient.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface RudderFacebookIntegration : NSObject<RudderIntegration>

@property (nonatomic, strong) NSDictionary *config;
@property (nonatomic, strong) RudderClient *client;
@property (nonatomic, strong) FBSDKAppEvents *instance;

- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RudderClient *)client;

@end

NS_ASSUME_NONNULL_END
