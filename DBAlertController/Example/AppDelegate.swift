//
//  AppDelegate.swift
//  DBAlertController
//
//  Created by Dylan Bettermann on 5/11/15.
//  Copyright (c) 2015 Dylan Bettermann. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = UINavigationController(rootViewController: ViewController())
        
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationDidBecomeActive(application: UIApplication) {
        let oldAlertController = UIAlertController(title: "UIAlertController", message: "This is the UIAlertController instance. Start the demo by pressing the Present button to present a modal UIViewController.", preferredStyle: .Alert)
        oldAlertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        window!.rootViewController?.presentViewController(oldAlertController, animated: true, completion: nil)
        
        let newAlertController = DBAlertController(title: "DBAlertController", message: "This is the DBAlertController instance.", preferredStyle: .Alert)
        newAlertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        newAlertController.show()
    }

}

