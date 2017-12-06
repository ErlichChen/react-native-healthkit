//
//  react_native_healthkit.h
//  react-native-healthkit
//
//  Created by 陈学伟 on 11/28/17.
//  Copyright © 2017 陈学伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

#import <HealthKit/HealthKit.h>


@interface react_native_healthkit: NSObject <RCTBridgeModule>

-(Boolean)isSupportHealthKit;

@end
