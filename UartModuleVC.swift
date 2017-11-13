//
//  UartModuleVC.swift
//  Basic Chat Lite

//  Created by Trevor Beaton on 7/11/17.
//  Copyright © 2017 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import CoreBluetooth


class UartModuleVC: UIViewController, CBCentralManagerDelegate {
    
    
    @IBAction func blueSwitchAction(_ sender: Any) {
        if blueSwitch.isOn {
            print("On ")
            writeValue(data: "1")
        }
        else
        {
            print("Off")
           writeValue(data: "0")
          print(writeCharacteristic)
        }
    }



    
    @IBOutlet weak var blueSwitch: UISwitch!
    
    var centralManager : CBCentralManager!
    var peripheral: CBPeripheral!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func disconnectAllConnection() {
        centralManager.cancelPeripheralConnection(peripheral!)
    }

    func writeCharacteristic(val: Int8){
        var val = val
        let ns = NSData(bytes: &val, length: MemoryLayout<Int8>.size)
        peripheral!.writeValue(ns as Data, for: txCharacteristic!, type: CBCharacteristicWriteType.withResponse)
        return 
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            // We will just handle it the easy way here: if Bluetooth is on, proceed...start scan!
            print("Bluetooth Enabled")
            //startScan()
            
        } else {
            //If Bluetooth is off, display a UI alert message saying "Bluetooth is not enable" and "Make sure that your bluetooth is turned on"
            print("Bluetooth Disabled- Make sure your Bluetooth is turned on")
            
            let alertVC = UIAlertController(title: "Bluetooth is not enabled", message: "Make sure that your bluetooth is turned on", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) -> Void in
                self.dismiss(animated: true, completion: nil)
            })
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    
    // Write functions
    func writeValue(data: String){
        let valueString = (data as NSString).data(using: String.Encoding.utf8.rawValue)
        //change the "data" to valueString
        if let blePeripheral = blePeripheral{
            
            if let txCharacteristic = txCharacteristic {
                
                blePeripheral.writeValue(valueString!, for: txCharacteristic, type: CBCharacteristicWriteType.withResponse)
            }
        }
    }
    

    
    
    
    
    
}
