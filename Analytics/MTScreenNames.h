//
//  MTScreenNames.h
//  Multiple-Analytics-Sample
//
//  Created by masato_arai on 2017/03/13.
//  Copyright © 2017年 Tea and Coffee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MTScreen) {
    MTScreenTopPage,
    MTScreenDetailPage,
    MTScreenSettingPage
};

#pragma mark Screen

OBJC_EXPORT NSString *MTGetScreenName(MTScreen screen);
OBJC_EXPORT NSArray<NSString *> *MTScreensNames();

NS_ASSUME_NONNULL_END
