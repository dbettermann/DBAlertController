//
//  ModalViewController.swift
//  DBAlertController
//
//  Created by Dylan Bettermann on 5/12/15.
//  Copyright (c) 2015 Dylan Bettermann. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Modal View Controller"
        
        view.backgroundColor = UIColor.whiteColor()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .Plain, target: self, action: #selector(dismiss))
    }
    
    func dismiss() {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
