//
//  HealthKitVitals.m
//  react-native-healthkit
//
//  Created by 陈学伟 on 11/30/17.
//  Copyright © 2017 陈学伟. All rights reserved.
//

#import "HealthKitVitals.h"
#import "HealthKitUtils.h"

@implementation HealthKitVitals

-(void)saveWeight:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback{
    
    double weight = [[data objectForKey:@"Weight"] doubleValue];
    NSDate *sampleDate = [HealthKitUtils dateStrig2Obj:[data objectForKey:@"Date"]];
    HKUnit *unit = [HealthKitUtils hkUnitFromOptions:data key:@"Unit" withDefault:[HKUnit poundUnit]];
    
    HKQuantity *weightQuantity = [HKQuantity quantityWithUnit:unit doubleValue:weight];
    HKQuantityType *weightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    HKQuantitySample *weightSample = [HKQuantitySample quantitySampleWithType:weightType quantity:weightQuantity startDate:sampleDate endDate:sampleDate];
    
    [healthStore saveObject:weightSample
                  withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            callback(@[[NSNull null], @{@"status": @false, @"reason": error.localizedDescription}]);
        }
        callback(@[[NSNull null], @{@"status": @true}]);
    }];
}

-(void)saveBloodGlucose:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback{
    
    double bloodGlucose = [[data objectForKey:@"BloodGlucose"] doubleValue];
    NSDate *sampleDate = [HealthKitUtils dateStrig2Obj:[data objectForKey:@"Date"]];
    HKUnit *unit = [HealthKitUtils hkUnitFromOptions:data key:@"Unit" withDefault:[HKUnit unitFromString:@"mg/dL"]];
    
    HKQuantity *bloodGlucoseQuantity = [HKQuantity quantityWithUnit:unit doubleValue:bloodGlucose];
    HKQuantityType *bloodGlucoseType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose];
    HKQuantitySample *bloodGlucoseSample = [HKQuantitySample quantitySampleWithType:bloodGlucoseType quantity:bloodGlucoseQuantity startDate:sampleDate endDate:sampleDate];
    
    [healthStore saveObject:bloodGlucoseSample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            callback(@[[NSNull null], @{@"status": @false, @"reason": error.localizedDescription}]);
        }
        callback(@[[NSNull null], @{@"status": @true}]);
    }];
    
}

-(void)saveOxygenSaturation:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback{
    
    double oxygenSaturation = [[data objectForKey:@"OxygenSaturation"] doubleValue];
    NSDate *sampleDate = [HealthKitUtils dateStrig2Obj:[data objectForKey:@"Date"]];
    HKUnit *unit = [HealthKitUtils hkUnitFromOptions:data key:@"Unit" withDefault:[HKUnit percentUnit]];
    
    HKQuantity *oxygenSaturationQuantity = [HKQuantity quantityWithUnit:unit doubleValue:oxygenSaturation];
    HKQuantityType *oxygenSaturationType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierOxygenSaturation];
    HKQuantitySample *oxygenSaturationSample = [HKQuantitySample quantitySampleWithType:oxygenSaturationType quantity:oxygenSaturationQuantity startDate:sampleDate endDate:sampleDate];
    
    [healthStore saveObject:oxygenSaturationSample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            callback(@[[NSNull null], @{@"status": @false, @"reason": error.localizedDescription}]);
        }
        callback(@[[NSNull null], @{@"status": @true}]);
    }];
    
}

-(void)saveBloodPressure:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback{
    
    double systolic = [[data objectForKey:@"BloodPressureSystolic"] doubleValue];
    double diastolic = [[data objectForKey:@"BloodPressureDiastolic"] doubleValue];
    NSDate *sampleDate = [HealthKitUtils dateStrig2Obj:[data objectForKey:@"Date"]];
    HKUnit *unit = [HealthKitUtils hkUnitFromOptions:data key:@"Unit" withDefault:[HKUnit millimeterOfMercuryUnit]];
    
    HKQuantity *systolicQuantity = [HKQuantity quantityWithUnit:unit doubleValue:systolic];
    HKQuantity *diastolicQuantity = [HKQuantity quantityWithUnit:unit doubleValue:diastolic];
    
    HKQuantityType *systolicType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];
    HKQuantityType *diastolicType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];
    
    HKQuantitySample *systolicSample = [HKQuantitySample quantitySampleWithType:systolicType quantity:systolicQuantity startDate:sampleDate endDate:sampleDate];
    HKQuantitySample *diastolicSample = [HKQuantitySample quantitySampleWithType:diastolicType quantity:diastolicQuantity startDate:sampleDate endDate:sampleDate];
    
    NSSet *objects=[NSSet setWithObjects:systolicSample,diastolicSample, nil];
    HKCorrelationType *bloodPressureType = [HKObjectType correlationTypeForIdentifier:
                                            HKCorrelationTypeIdentifierBloodPressure];
    
    HKCorrelation *BloodPressure = [HKCorrelation correlationWithType:bloodPressureType startDate:sampleDate endDate:sampleDate objects:objects];
    [healthStore saveObject:BloodPressure withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            callback(@[[NSNull null], @{@"status": @false, @"reason": error.localizedDescription}]);
        }
        callback(@[[NSNull null], @{@"status": @true}]);
    }];
}

-(void)saveHeartRate:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback{
    
    double heartRate = [[data objectForKey:@"HeartRate"] doubleValue];
    NSDate *sampleDate = [HealthKitUtils dateStrig2Obj:[data objectForKey:@"Date"]];
    HKUnit *unit = [HealthKitUtils hkUnitFromOptions:data key:@"Unit" withDefault:[HKUnit countUnit]];
    
    HKQuantity *heartRateQuantity = [HKQuantity quantityWithUnit:unit doubleValue:heartRate];
    HKQuantityType *heartRateType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    HKQuantitySample *heartRateSample = [HKQuantitySample quantitySampleWithType:heartRateType quantity:heartRateQuantity startDate:sampleDate endDate:sampleDate];
    
    [healthStore saveObject:heartRateSample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            callback(@[[NSNull null], @{@"status": @false, @"reason": error.localizedDescription}]);
        }
        callback(@[[NSNull null], @{@"status": @true}]);
    }];
    
}

-(void)saveBodyTemperature:(HKHealthStore*) healthStore healthData:(NSDictionary*)data callback: (RCTResponseSenderBlock)callback{
    
    double bodyTemperature = [[data objectForKey:@"BodyTemperature"] doubleValue];
    NSDate *sampleDate = [HealthKitUtils dateStrig2Obj:[data objectForKey:@"Date"]];
    HKUnit *unit = [HealthKitUtils hkUnitFromOptions:data key:@"Unit" withDefault:[HKUnit degreeFahrenheitUnit]];
    
    HKQuantity *bodyTemperatureQuantity = [HKQuantity quantityWithUnit:unit doubleValue:bodyTemperature];
    HKQuantityType *bodyTemperatureType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    HKQuantitySample *bodyTemperatureSample = [HKQuantitySample quantitySampleWithType:bodyTemperatureType quantity:bodyTemperatureQuantity startDate:sampleDate endDate:sampleDate];
    
    [healthStore saveObject:bodyTemperatureSample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            callback(@[[NSNull null], @{@"status": @false, @"reason": error.localizedDescription}]);
        }
        callback(@[[NSNull null], @{@"status": @true}]);
    }];
    
}

@end
