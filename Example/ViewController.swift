//
//  ViewController.swift
//  DBAlertController
//
//  Created by Dylan Bettermann on 5/11/15.
//  Copyright (c) 2015 Dylan Bettermann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DBAlertController Demo"
        
        view.backgroundColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Present", style: .plain, target: self, action: #selector(ViewController.present as (ViewController) -> () -> ()))
    }
    
    func present() {
        let modalViewController = UINavigationController(rootViewController: ModalViewController())
        modalViewController.modalPresentationStyle = .formSheet
        self.present(modalViewController, animated: true, completion: {
            let instructions = UIAlertController(title: "Instructions", message: "Now press the home button. When you resume the app, the default UIAlertController will not be presented and you will receive a warning message in your console. The DBAlertController will be presented.", preferredStyle: .alert)
            instructions.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            modalViewController.present(instructions, animated: true, completion: nil)
        })
    }


}

