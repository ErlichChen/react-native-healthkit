//
//  HealthKitUtils.h
//  react-native-healthkit
//
//  Created by 陈学伟 on 11/30/17.
//  Copyright © 2017 陈学伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>

@interface HealthKitUtils : NSObject

+ (NSDate *)dateStrig2Obj:(NSString*)dateString;
+ (HKUnit *)hkUnitFromOptions:(NSDictionary *)options key:(NSString *)key withDefault:(HKUnit *)defaultValue;

@end
