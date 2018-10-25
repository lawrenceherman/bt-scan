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

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.red

    centralManager = CBCentralManager(delegate: self, queue: nil)
    

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
    }
  }

  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
    
    print("central \(central)")
    print("peripheral \(peripheral)")
    print("advertisementData \(advertisementData)")
    print("RSSI \(RSSI)")
    
    centralManager.stopScan()
//    print("test")
  }



}

