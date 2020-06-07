//
//  RudderFacebookIntegration.h
//  FBSnapshotTestCase
//
//  Created by Arnab Pal on 15/11/19.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface RudderFacebookIntegration : NSObject<RSIntegration>

@property (nonatomic, strong) NSDictionary *config;
@property (nonatomic, strong) RSClient *client;
@property (nonatomic, strong) FBSDKAppEvents *instance;

- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client;

@end

NS_ASSUME_NONNULL_END
