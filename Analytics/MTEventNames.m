//
//  MTEventNames.m
//  Multiple-Analytics-Sample
//
//  Created by masato_arai on 2017/03/13.
//  Copyright © 2017年 Tea and Coffee. All rights reserved.
//

#import "MTEventNames.h"

#pragma mark Category

NSString *MTGetCategoryName(MTCategory category) {
    return MTCategoriesNames()[category];
}

NSArray<NSString *> *MTCategoriesNames() {
    return @[@"Top",
             @"Detail",
             @"Setting"];
}

#pragma mark Action

NSString *MTGetActionName(MTAction action) {
    return MTActionsNames()[action];
}

NSArray<NSString *> *MTActionsNames() {
    return @[// Top
             @"AddClick",
             @"RemoveClick",
             // Detail
             @"RegisterComp",
             @"UnregisterComp",
             // Setting
             @"InfoView",
             @"Comp"
             ];
}

#pragma mark Label

MTLabel const MTLabelCategory           = @"category";
MTLabel const MTLabelId                 = @"id";

NSString * const MTAnimal               = @"animal";
NSString * const MTScience              = @"science";

#pragma mark Value

NSString * const MTValue                = @"value";
