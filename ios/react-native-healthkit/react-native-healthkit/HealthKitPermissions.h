//
//  HealthKitPermissions.h
//  react-native-healthkit
//
//  Created by 陈学伟 on 11/29/17.
//  Copyright © 2017 陈学伟. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <HealthKit/HealthKit.h>

@interface HealthKitPermissions: NSObject

+(NSSet *)getPermissionsFromOptions:(NSArray *)options;

@end
