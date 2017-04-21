//
//  DBAlertController.swift
//  DBAlertController
//
//  Created by Dylan Bettermann on 5/11/15.
//  Copyright (c) 2015 Dylan Bettermann. All rights reserved.
//

import UIKit

public class DBAlertController: UIAlertController {
    public static var windowLevel: UIWindowLevel = UIWindowLevelNormal // default
   
    /// The UIWindow that will be at the top of the window hierarchy. The DBAlertController instance is presented on the rootViewController of this window.
    private lazy var alertWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.windowLevel = DBAlertController.windowLevel
        window.rootViewController = DBClearViewController()
        window.backgroundColor = UIColor.clearColor()
		window.windowLevel = UIWindowLevelAlert
        return window
    }()
    
    /**
    Present the DBAlertController on top of the visible UIViewController.
    
    - parameter flag:       Pass true to animate the presentation; otherwise, pass false. The presentation is animated by default.
    - parameter completion: The closure to execute after the presentation finishes.
    */
    public func show(animated flag: Bool = true, completion: (() -> Void)? = nil) {
        let duplicatedAlerts = UIApplication.sharedApplication().windows.filter { [weak self] in
            $0.rootViewController?.presentedViewController?.restorationIdentifier == self?.restorationIdentifier
        }
        if duplicatedAlerts.count > 0 { return }
        if let rootViewController = alertWindow.rootViewController {
            alertWindow.makeKeyAndVisible()
            
            rootViewController.presentViewController(self, animated: flag, completion: completion)
        }
    }
    
}

// In the case of view controller-based status bar style, make sure we use the same style for our view controller
private class DBClearViewController: UIViewController {
    
    private override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIApplication.sharedApplication().statusBarStyle
    }
    
    private override func prefersStatusBarHidden() -> Bool {
        return UIApplication.sharedApplication().statusBarHidden
    }
    
}
