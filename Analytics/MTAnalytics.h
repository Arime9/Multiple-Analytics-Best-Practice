//
//  MTAnalytics.h
//  Multiple-Analytics-Sample
//
//  Created by masato_arai on 2017/03/13.
//  Copyright © 2017年 Tea and Coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTScreenNames.h"
#import "MTEventNames.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTAnalytics : NSObject

#pragma mark Screen

/// You need to read the [FIRAnalytics setScreenName:screenClass:].
+ (void)logWithScreen:(MTScreen)screen;
/// You need to read the [FIRAnalytics setScreenName:screenClass:].
+ (void)logWithScreen:(MTScreen)screen googleAnalytics:(BOOL)ga firebase:(BOOL)fir;

#pragma mark Event

+ (void)logWithCategory:(MTCategory)category action:(MTAction)action;
+ (void)logWithCategory:(MTCategory)category action:(MTAction)action parameters:(nullable NSDictionary<MTLabel, NSString *> *)parameters;
+ (void)logWithCategory:(MTCategory)category action:(MTAction)action value:(nullable NSNumber *)value;
+ (void)logWithCategory:(MTCategory)category action:(MTAction)action parameters:(nullable NSDictionary<MTLabel, NSString *> *)parameters value:(nullable NSNumber *)value;

@end

NS_ASSUME_NONNULL_END
