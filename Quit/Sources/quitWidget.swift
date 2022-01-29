//
//  quitWidget.swift
//  Quit
//
//  Created by Kyle Gorter on 1/25/22.
//  
//

import Foundation
import AppKit
import PockKit
import IOBluetooth

class quitWidget: PKWidget {
    
    static var identifier = "com.davidchu.PockBluetooth"
    var customizationLabel = "Bluetooth toggle"
    var view: NSView!
    var state: Int32 = 0
    var timer: Timer?
    
    required init() {
        view = BluetoothButton(target: self, action: #selector(onClick))
        // get current bluetooth state
        state = IOBluetoothPreferenceGetControllerPowerState()
        (view as! BluetoothButton).highlight(state == 1)
        (view as! BluetoothButton).state = state == 1 ? .on : .off
        
    }
    
    @objc private func onClick() {
        state = state == 0 ? 1 : 0
        IOBluetoothPreferenceSetControllerPowerState(state)
        
        if state == 1 {
            //needs a timer for whatever reason to keep the thread alive. Time interval can't be 0.
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(connectToHeadphones), userInfo: nil, repeats: false)
        }
    }
    
    @objc private func connectToHeadphones() {
        IOBluetoothDevice.pairedDevices()!.map({$0 as! IOBluetoothDevice})
            .filter({$0.name == "Speed McSpeed"})
            .map({IOBluetoothDevicePair(device: $0)!})
            .forEach({
                $0.start()
                print($0.device().name)
            })
    }
}
