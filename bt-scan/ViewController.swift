//
//  ViewController.swift
//  bt-scan
//
//  Created by Lawrence Herman on 10/23/18.
//  Copyright © 2018 Lawrence Herman. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
  
  var centralManager: CBCentralManager!
  var tempPeripheral: CBPeripheral!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.red
    
    centralManager = CBCentralManager(delegate: self, queue: nil)
    
    //    why not needed?
    //    centralManager.delegate = self
    

  }
}


extension ViewController: CBCentralManagerDelegate {
  
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    
    switch central.state {
    case .unknown:
      print("central.state is .unknown")
    case .resetting:
      print("central.state is .resetting")
    case .unsupported:
      print("central.state is .unsupported")
    case .unauthorized:
      print("central.state is .unauthorized")
    case .poweredOff:
      print("central.state is .poweredOff")
    case .poweredOn:
      print("central.state is .poweredOn")
      centralManager.scanForPeripherals(withServices: nil, options: nil)
      
      // prevent duplicates?? doesnt seem to effect
      //      centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
      
    }
  }
  
  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
    
    print("didDiscover peripheral")
    print("central \(central)")
    print("peripheral \(peripheral)")
    print("advertisementData \(advertisementData)")
    print("RSSI \(RSSI)")
    
    centralManager.stopScan()
    
    tempPeripheral = peripheral
    tempPeripheral.delegate = self
    
    centralManager.connect(tempPeripheral, options: nil)
    
//    let CBConnectPeripheralOptionNotifyOnConnectionKey: String
//    let CBConnectPeripheralOptionNotifyOnDisconnectionKey: String
//    let CBConnectPeripheralOptionNotifyOnNotificationKey: String

  }
  
  
  ///////////////// peripheral connections
  
  func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
    print("didConnect peripheral")
    peripheral.discoverServices(nil)
  }
  
  func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
    print("didDisconnectPeripheral")
    
    if let didDisconnectPeripheralError = error {
      print("didDisconnectPeripheral error \(didDisconnectPeripheralError.localizedDescription)")

    }
  }
  
  func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
    print("didFailToConnect")
    
    if let didFailToConnectError = error {
      print("didFailToConnectError \(didFailToConnectError.localizedDescription)")
    }
  }
}

////////////////

extension ViewController: CBPeripheralDelegate {
  
  func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
   
    print("    ")
    print("    ")
    
    if let didDiscoverServicesError = error {
      print("didDiscoverServices error \(didDiscoverServicesError.localizedDescription)")
    }
    
    if let services = peripheral.services {
      for service in services {
        print(service)
        peripheral.discoverCharacteristics(nil, for: service)
      
      }
    }
  
    print("     ")
  }
  
  
  func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
    
    if let didDiscoverCharacteristicsForError = error {
      print("didDiscoverCharacteristicsFor error \(didDiscoverCharacteristicsForError.localizedDescription)")
  
    }
    
    if let characteristics = service.characteristics {
      print(service)

      for characteristic in characteristics {
        print(characteristic)
      
      
        peripheral.discoverDescriptors(for: characteristic)

      
      }
    
    print("    ")
    
    }
  }


  func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
 
    if let didDiscoverDescriptorsForError = error {
      print("didDiscoverDescriptorsFor error \(didDiscoverDescriptorsForError.localizedDescription)")
    }
  
    if let descriptors = characteristic.descriptors {
      print(characteristic)
      for descriptor in descriptors {
        print(descriptor)
        print(descriptor.uuid.uuidString)
        print(descriptor.uuid.description)
        
      }
    
    
    }
 
   print( "    ")
  
  
  }
}
