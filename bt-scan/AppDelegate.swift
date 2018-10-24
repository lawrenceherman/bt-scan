//
//  AppDelegate.swift
//  bt-scan
//
//  Created by Lawrence Herman on 10/23/18.
//  Copyright © 2018 Lawrence Herman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()
    window?.makeKeyAndVisible()
    
    let firstVC = ViewController()
    window?.rootViewController = firstVC
  
    
    
//      These keys are passed to the options dictionary passed to the application(_:willFinishLaunchingWithOptions:) and application(_:didFinishLaunchingWithOptions:) methods of the app delegate
//    static let bluetoothPeripherals: UIApplication.LaunchOptionsKey
//    A key indicating that the app should continue actions associated with its Bluetooth peripheral objects.
//    static let cloudKitShareMetadata: UIApplication.LaunchOptionsKey
//    A key indicating that the app received a CloudKit share invitation.
    

//
//    An iOS app linked on or after iOS 10.0 must include in its Info.plist file the usage description keys for the types of data it needs to access or it will crash. To access Bluetooth peripheral data specifically, it must include NSBluetoothPeripheralUsageDescription.



    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

