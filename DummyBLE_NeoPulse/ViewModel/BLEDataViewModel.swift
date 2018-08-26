//
//  BLEDataViewModel.swift
//  DummyBLE_NeoPulse
//
//  Created by Abhishek Chaudhari on 25/08/18.
//  Copyright © 2018 Abhishek Chaudhari. All rights reserved.
//

import Foundation

class BLEDataViewModel{
    var data = BLEDataMadel() {
        didSet {
            heartRateString.value = data.heartRate + " bmp"
            respirationString.value = data.respiration + " Brmp"
            skinTempratureString.value = data.skinTemprature + " °C"
            stepsString.value = data.steps
        }
    }
    
    var heartRateString: Box<String?> = Box(nil)
    var respirationString: Box<String?> = Box(nil)
    var skinTempratureString: Box<String?> = Box(nil)
    var stepsString: Box<String?> = Box(nil)
    
    init(bleData: BLEDataMadel) {
        data = bleData
    }
}
