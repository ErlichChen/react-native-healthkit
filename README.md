# react-native-healthkit

## References

Thank this project. I forked some code.
[https://github.com/terrillo/rn-apple-healthkit/blob/master/README.md]

## How to install

1. Instal react-native-healthkit package from npm.

```shell
npm install react-native-healthkit --save
react-native link react-native-healthkit
```

2. Update info.plist in your React Native project.

```xml
<key>NSHealthShareUsageDescription</key>
<string>Read and write health data.</string>
<key>NSHealthUpdateUsageDescription</key>
<string>Read and write health data.</string>
```

3. Enable HealthKit in your React Native project.

## How to use 

### 1. import package

```javascript
import { RNHealthKit } from 'react-native-healthkit';
```


### 2. isSupportHealthKit

```javascript
RNHealthKit.isSupportHealthKit((error, events) => {
    console.log(events);
})
```

### 3. requestPermissions

```javascript
let permissions = {
    read: ['Weight', 'BloodGlucose', 'OxygenSaturation', 'BloodPressureSystolic', 'BloodPressureDiastolic', 'BodyTemperature', 'HeartRate'],
    write: ['Weight', 'BloodGlucose', 'OxygenSaturation', 'BloodPressureSystolic', 'BloodPressureDiastolic', 'BodyTemperature', 'HeartRate'],
};
RNHealthKit.requestPermissions(permissions, (error, events) => {
    console.log(events);
})
```

### 4. Save health data.

1. Save health weight data

```javascript
let healthData = {
    HKType: 'Weight',
    Weight: 160,
    Date: '2017-12-05 10:10:10',
    Unit: 'lb'
}
RNHealthKit.saveHealthData(healthData, (error, events) => {
    console.log(events);
})
```

2. Save health blood glucose

```javascript
let healthData = {
    HKType: 'BloodGlucose',
    BloodGlucose: 100,
    Date: '2017-12-05 10:10:10',
    Unit: 'mg/dL'
}
RNHealthKit.saveHealthData(healthData, (error, events) => {
    console.log(events);
})
```

3. Save oxygensaturation data

```javascript
let healthData = {
    HKType: 'OxygenSaturation',
    OxygenSaturation: 0.99,
    Date: '2017-12-05 10:10:10',
    Unit: '%'
}
RNHealthKit.saveHealthData(healthData, (error, events) => {
    console.log(events);
})
```

4. Save blood pressure data

```javascript
let healthData = {
    HKType: 'BloodPressure',
    BloodPressureSystolic: 120,
    BloodPressureDiastolic: 70,
    Date: '2017-12-05 10:10:10',
    Unit: 'mmhg'
}
RNHealthKit.saveHealthData(healthData, (error, events) => {
    console.log(events);
})
```

5. Save heart rate data

```javascript
let healthData = {
    HKType: 'HeartRate',
    HeartRate: 70,
    Date: '2017-12-05 10:10:10',
    Unit: 'cpm'
}
RNHealthKit.saveHealthData(healthData, (error, events) => {
    console.log(events);
})
```

6. Save body temperature

```javascript
let healthData = {
    HKType: 'BodyTemperature',
    BodyTemperature: 20,
    Date: '2017-12-05 10:10:10',
    Unit: 'celsius'
}
RNHealthKit.saveHealthData(healthData, (error, events) => {
    console.log(events);
})
```

## TODO
