//
//  MTScreenNames.m
//  Multiple-Analytics-Sample
//
//  Created by masato_arai on 2017/03/13.
//  Copyright © 2017年 Tea and Coffee. All rights reserved.
//

#import "MTScreenNames.h"

#pragma mark Screen

NSString *MTGetScreenName(MTScreen screen) {
    return MTScreensNames()[screen];
}

NSArray<NSString *> *MTScreensNames() {
    return @[@"TopPage",
             @"DetailPage",
             @"SettingPage"];
}
