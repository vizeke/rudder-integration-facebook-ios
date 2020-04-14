//
//  RudderFacebookFactory.h
//  FBSnapshotTestCase
//
//  Created by Arnab Pal on 15/11/19.
//

#import <Foundation/Foundation.h>
#import <Rudder/RudderIntegrationFactory.h>

NS_ASSUME_NONNULL_BEGIN

@interface RudderFacebookFactory : NSObject<RudderIntegrationFactory>

+ (instancetype) instance;

@end

NS_ASSUME_NONNULL_END
