//
//  MTEventNames.h
//  Multiple-Analytics-Best-Practice
//
//  Created by masato_arai on 2017/03/13.
//  Copyright © 2017年 Tea and Coffee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MTCategory) {
    MTCategoryTop,
    MTCategoryDetail,
    MTCategorySetting
};

typedef NS_ENUM(NSUInteger, MTAction) {
    // Top
    MTActionTopAddClick,
    MTActionTopRemoveClick,
    // Detail
    MTActionDetailRegisterComp,
    MTActionDetailUnregisterComp,
    // Setting
    MTActionSettingInfoView,
    MTActionSettingComp
};

#pragma mark Category

OBJC_EXPORT NSString *MTGetCategoryName(MTCategory category);
OBJC_EXPORT NSArray<NSString *> *MTCategoriesNames();

#pragma mark Action

OBJC_EXPORT NSString *MTGetActionName(MTAction action);
OBJC_EXPORT NSArray<NSString *> *MTActionsNames();

#pragma mark Label

typedef NSString * MTLabel NS_EXTENSIBLE_STRING_ENUM;

UIKIT_EXTERN MTLabel const MTLabelCategory;
UIKIT_EXTERN MTLabel const MTLabelId;

UIKIT_EXTERN NSString * const MTAnimal;
UIKIT_EXTERN NSString * const MTScience;

#pragma mark Value

UIKIT_EXTERN NSString * const MTValue;

NS_ASSUME_NONNULL_END
