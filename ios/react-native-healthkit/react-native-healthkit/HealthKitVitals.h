//
//  HealthKitVitals.h
//  react-native-healthkit
//
//  Created by 陈学伟 on 11/30/17.
//  Copyright © 2017 陈学伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>

#import <React/RCTBridgeModule.h>

@interface HealthKitVitals : NSObject

-(void)saveWeight:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback;
-(void)saveBloodGlucose:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback;
-(void)saveOxygenSaturation:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback;
-(void)saveBloodPressure:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback;
-(void)saveHeartRate:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback;
-(void)saveBodyTemperature:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback;

@end
