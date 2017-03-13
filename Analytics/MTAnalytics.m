//
//  MTAnalytics.m
//  Multiple-Analytics-Sample
//
//  Created by masato_arai on 2017/03/13.
//  Copyright © 2017年 Tea and Coffee. All rights reserved.
//

#import "MTAnalytics.h"

#import <GoogleAnalytics/GAI.h>
#import <GoogleAnalytics/GAIDictionaryBuilder.h>
#import <GoogleAnalytics/GAIFields.h>

#import <Firebase/Firebase.h>

@implementation MTAnalytics

#pragma mark
#pragma mark Screen

+ (void)logWithScreen:(MTScreen)screen {
    [self logWithScreen:screen googleAnalytics:YES firebase:YES];
}

+ (void)logWithScreen:(MTScreen)screen googleAnalytics:(BOOL)ga firebase:(BOOL)fir {
    // Create screenName
    NSString *screenName = MTGetScreenName(screen);
    
    if (ga) { [self _gaLogWithScreenName:screenName]; }
    if (fir) { [self _firLogWithScreenName:screenName]; }
}

#pragma mark Screen/GA

+ (void)_gaLogWithScreenName:(NSString *)screenName {
    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    [tracker set:kGAIScreenName value:screenName];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

#pragma mark Screen/Firebase

+ (void)_firLogWithScreenName:(nullable NSString *)screenName {
    [FIRAnalytics setScreenName:screenName screenClass:nil];
}

#pragma mark
#pragma mark Event

+ (void)logWithCategory:(MTCategory)category action:(MTAction)action {
    [self logWithCategory:category action:action parameters:nil value:nil];
}

+ (void)logWithCategory:(MTCategory)category action:(MTAction)action parameters:(nullable NSDictionary<MTLabel, NSString *> *)parameters {
    [self logWithCategory:category action:action parameters:parameters value:nil];
}

+ (void)logWithCategory:(MTCategory)category action:(MTAction)action value:(nullable NSNumber *)value {
    [self logWithCategory:category action:action parameters:nil value:value];
}

+ (void)logWithCategory:(MTCategory)category action:(MTAction)action parameters:(nullable NSDictionary<MTLabel, NSString *> *)parameters value:(nullable NSNumber *)value {
    // Create category
    NSString *categoryName = MTGetCategoryName(category);
    // Create action
    NSString *actionName = MTGetActionName(action);
    
    [self _gaLogWithCategory:categoryName action:actionName parameters:parameters value:value];
    [self _firLogWithCategory:categoryName action:actionName parameters:parameters value:value];
}

#pragma mark Event/GA

+ (void)_gaLogWithCategory:(NSString *)category action:(NSString *)action parameters:(nullable NSDictionary<MTLabel, NSString *> *)parameters value:(nullable NSNumber *)value {
    // Create label
    NSString *label;
    if (parameters.count) {
        NSMutableArray *mLabels = [NSMutableArray array];
        [parameters enumerateKeysAndObjectsUsingBlock:^(MTLabel  _Nonnull key, NSString * _Nonnull str, BOOL * _Nonnull stop) {
            [mLabels addObject:[NSString stringWithFormat:@"%@:%@", key, str]];
        }];
        label = [mLabels componentsJoinedByString:@","];
    }
    
    [self _gaLogWithCategory:category action:action label:label value:value];
}

+ (void)_gaLogWithCategory:(NSString *)category action:(NSString *)action label:(nullable NSString *)label value:(nullable NSNumber *)value {
    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category action:action label:label value:value] build]];
}

#pragma mark Event/Firebase

+ (void)_firLogWithCategory:(NSString *)category action:(NSString *)action parameters:(nullable NSDictionary<MTLabel, NSString *> *)parameters value:(nullable NSNumber *)value {
    // Create name
    NSString *name = [NSString stringWithFormat:@"%@_%@", category, action];
    
    // Create parameters
    NSMutableDictionary<NSString *, NSObject *> *mParameters;
    if (parameters.count || ![NSNull isNull:value]) {
        mParameters = parameters.count ? [parameters mutableCopy] : [NSMutableDictionary dictionary];
        if (![NSNull isNull:value]) { mParameters[MTValue] = value; }
    }
    
    [self _firLogWithName:name parameters:mParameters];
}

+ (void)_firLogWithName:(NSString *)name parameters:(nullable NSDictionary<NSString *, NSObject *> *)parameters {
    [FIRAnalytics logEventWithName:name parameters:parameters];
}

@end
