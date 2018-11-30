//
//  react_native_healthkit.m
//  react-native-healthkit
//
//  Created by 陈学伟 on 11/28/17.
//  Copyright © 2017 陈学伟. All rights reserved.
//

#import "react_native_healthkit.h"

#import <React/RCTEventDispatcher.h>
#import <React/RCTLog.h>

#import "HealthKitPermissions.h"
#import "HealthKitVitals.h"

@interface react_native_healthkit()

@property (nonatomic) HKHealthStore *healthStore;
@property (nonatomic) HealthKitVitals *healthKitVitals;

@end

@implementation react_native_healthkit

RCT_EXPORT_MODULE(RNHealthKit);

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.healthStore = [[HKHealthStore alloc] init];
        self.healthKitVitals = [[HealthKitVitals alloc] init];
    }
    return self;
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

RCT_EXPORT_METHOD(isSupportHealthKit:(RCTResponseSenderBlock)callback){
    
    if([self isSupportHealthKit]){
        callback(@[[NSNull null], @{@"status": @true}]);
    } else {
        callback(@[[NSNull null], @{@"status": @false, @"reason": @"don't support healthkit."}]);
    }
}

RCT_EXPORT_METHOD(requestPermissions: (NSDictionary *)permissions callback: (RCTResponseSenderBlock)callback){
    if([self isSupportHealthKit]){
        
        NSSet* readDataTypes;
        NSSet* writeDataTypes;
        
        NSArray* readPermissionsArray = [permissions objectForKey:@"read"];
        NSArray* writePermissionsArray = [permissions objectForKey:@"write"];
        NSSet* readPermissions = [HealthKitPermissions getPermissionsFromOptions:readPermissionsArray];
        NSSet* writePermissions = [HealthKitPermissions getPermissionsFromOptions:writePermissionsArray];
        
        if(readPermissions != nil){
            readDataTypes = readPermissions;
        }
        
        if(writePermissions != nil){
            writeDataTypes = writePermissions;
        }
        
        if(!readDataTypes && !writeDataTypes){
            callback(@[[NSNull null], @{@"status": @false, @"reason": @"make sure at 1 read or write permission is provided."}]);
        }
        
        [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
            if (!success) {
                callback(@[[NSNull null], @{@"status": @false, @"reason": error.localizedDescription}]);
            } else {
                callback(@[[NSNull null], @{@"status": @true}]);
            }
        }];
        
    }else{
        callback(@[[NSNull null], @{@"status": @false, @"reason": @"don't support healthkit."}]);
    }
}

RCT_EXPORT_METHOD(saveHealthData: (NSDictionary *)healthData callback: (RCTResponseSenderBlock)callback){
    
    NSString* type = [healthData objectForKey:@"HKType"];

    if ([type isEqualToString:@"Weight"]) {
        [_healthKitVitals saveWeight:_healthStore healthData:healthData callback:callback];
        
    } else if([type isEqualToString:@"BloodGlucose"]){
        [_healthKitVitals saveBloodGlucose:_healthStore healthData:healthData callback:callback];
        
    } else if([type isEqualToString:@"OxygenSaturation"]){
        [_healthKitVitals saveOxygenSaturation:_healthStore healthData:healthData callback:callback];
        
    } else if([type isEqualToString:@"HeartRate"]){
        [_healthKitVitals saveHeartRate:_healthStore healthData:healthData callback:callback];
        
    } else if([type isEqualToString:@"BloodPressure"]){
        [_healthKitVitals saveBloodPressure:_healthStore healthData:healthData callback:callback];
        
    } else if([type isEqualToString:@"BodyTemperature"]){
        [_healthKitVitals saveBodyTemperature:_healthStore healthData:healthData callback:callback];
        
    } else {
        callback(@[[NSNull null], @{@"status": @false, @"reason": @"don't support device type"}]);
    }

}

-(Boolean)isSupportHealthKit{
    if([HKHealthStore isHealthDataAvailable]){
        return true;
    } else {
        return false;
    }
}
                   
@end
