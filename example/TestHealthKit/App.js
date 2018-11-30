/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TouchableOpacity
} from 'react-native';
import { RNHealthKit } from 'react-native-healthkit';


export default class App extends Component {

  onIsSupportHealthKit = () => {
    console.log('testisSupportHealthKit');
    RNHealthKit.isSupportHealthKit((error, events) => {
      console.log(events);
    })
  }

  onRequestPermissions = () => {
    console.log('testRequestPermissions');
    let permissions = {
      read: ['Weight', 'BloodGlucose', 'OxygenSaturation', 'BloodPressureSystolic', 'BloodPressureDiastolic', 'BodyTemperature', 'HeartRate'],
      write: ['Weight', 'BloodGlucose', 'OxygenSaturation', 'BloodPressureSystolic', 'BloodPressureDiastolic', 'BodyTemperature', 'HeartRate'],
    };
    RNHealthKit.requestPermissions(permissions, (error, events) => {
      console.log(events);
    })
  }

  onSaveHealthWeight = () => {
    console.log('testSaveHealthWeight');
    let healthData = {
      HKType: 'Weight',
      Weight: 160,
      Date: '2017-12-05 10:10:10',
      Unit: 'lb'
    }
    RNHealthKit.saveHealthData(healthData, (error, events) => {
      console.log(events);
    })
  }

  onSaveBloodGlucose = () => {
    console.log('testSaveBloodGlucose');
    let healthData = {
      HKType: 'BloodGlucose',
      BloodGlucose: 100,
      Date: '2017-12-05 10:10:10',
      Unit: 'mg/dL'
    }
    RNHealthKit.saveHealthData(healthData, (error, events) => {
      console.log(error);
      console.log(events);
    })
  }

  onSaveOxygenSaturation = () => {
    console.log('testSaveOxygenSaturation');
    let healthData = {
      HKType: 'OxygenSaturation',
      OxygenSaturation: 0.99,
      Date: '2017-12-05 10:10:10',
      Unit: '%'
    }
    RNHealthKit.saveHealthData(healthData, (error, events) => {
      console.log(events);
    })
  }

  onSaveBloodPressure = () => {
    console.log('testSaveBloodPressure');
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
  }

  onSaveHeartRate = () => {
    console.log('testSaveHeartRate');
    let healthData = {
      HKType: 'HeartRate',
      HeartRate: 70,
      Date: '2017-12-05 10:10:10',
      Unit: 'cpm'
    }
    RNHealthKit.saveHealthData(healthData, (error, events) => {
      console.log(events);
    })
  }

  onSaveBodyTemperature = () => {
    console.log('testSaveBodyTemperature');
    let healthData = {
      HKType: 'BodyTemperature',
      BodyTemperature: 20,
      Date: '2017-12-05 10:10:10',
      Unit: 'celsius'
    }
    RNHealthKit.saveHealthData(healthData, (error, events) => {
      console.log(events);
    })
  }

  render() {    
    const {buttonStyle, textStyle} = styles;
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={ this.onIsSupportHealthKit.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          is support HealthKit.
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={ this.onRequestPermissions.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          request permissions.
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={ this.onSaveHealthWeight.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          save health weight
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={ this.onSaveBloodGlucose.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          save health bloodglucose
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={ this.onSaveOxygenSaturation.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          save health oxygen saturation
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={ this.onSaveBloodPressure.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          save health blood pressure
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={ this.onSaveHeartRate.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          save health heart rate
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={ this.onSaveBodyTemperature.bind(this) } style={buttonStyle}>
          <Text style={textStyle}>
          save body temperature
          </Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: 40,
    paddingBottom: 30,
    backgroundColor: '#F5FCFF',
  },
  textStyle: {
    alignSelf: 'center',
    color: '#007aff',
    fontSize: 16,
    fontWeight: '600',
    paddingTop: 10,
    paddingBottom: 10
  },
  buttonStyle: {
    flex: 1,
    alignSelf: 'stretch',
    backgroundColor: '#fff',
    borderRadius: 5,
    borderWidth: 1,
    borderColor: '#007aff',
    marginTop: 5,
    marginLeft: 5,
    marginRight: 5
  }
});
