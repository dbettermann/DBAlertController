//
//  AppDelegate.swift
//  DBAlertController
//
//  Created by Dylan Bettermann on 5/11/15.
//  Copyright (c) 2015 Dylan Bettermann. All rights reserved.
//

import UIKit
import DBAlertController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UINavigationController(rootViewController: ViewController())
        
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let oldAlertController = UIAlertController(title: "UIAlertController", message: "This is the UIAlertController instance. Start the demo by pressing the Present button to present a modal UIViewController.", preferredStyle: .alert)
        oldAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        window!.rootViewController?.present(oldAlertController, animated: true, completion: nil)
        
        let newAlertController = DBAlertController(title: "DBAlertController", message: "This is the DBAlertController instance.", preferredStyle: .alert)
        newAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        newAlertController.show()
    }

}

