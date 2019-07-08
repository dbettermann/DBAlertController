//
//  DBAlertController.swift
//  DBAlertController
//
//  Created by Dylan Bettermann on 5/11/15.
//  Copyright (c) 2015 Dylan Bettermann. All rights reserved.
//

import UIKit

open class DBAlertController: UIAlertController {
   
    /// The UIWindow that will be at the top of the window hierarchy. The DBAlertController instance is presented on the rootViewController of this window.
    fileprivate lazy var alertWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = DBClearViewController()
        window.backgroundColor = UIColor.clear
		window.windowLevel = UIWindow.Level.alert
        return window
    }()
    
    /**
    Present the DBAlertController on top of the visible UIViewController.
    
    - parameter flag:       Pass true to animate the presentation; otherwise, pass false. The presentation is animated by default.
    - parameter completion: The closure to execute after the presentation finishes.
    */
    open func show(animated flag: Bool = true, completion: (() -> Void)? = nil) {
        if let rootViewController = alertWindow.rootViewController {
            alertWindow.makeKeyAndVisible()
            
            rootViewController.present(self, animated: flag, completion: completion)
        }
    }
    
}

// In the case of view controller-based status bar style, make sure we use the same style for our view controller
private class DBClearViewController: UIViewController {
    
    fileprivate override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIApplication.shared.statusBarStyle
    }
    
    fileprivate override var prefersStatusBarHidden: Bool {
        return UIApplication.shared.isStatusBarHidden
    }
    
}
