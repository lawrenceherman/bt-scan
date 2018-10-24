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
    print("central is scanning -\(central.isScanning)")
    
    print("central state \(central.state)")
  
  
  }
  
  




}

