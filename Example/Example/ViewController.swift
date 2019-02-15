//
//  ViewController.swift
//  Example
//
//  Created by Alberto García-Muñoz on 15/02/2019.
//  Copyright © 2019 AlbGarciam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    class func create() -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateInitialViewController()
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("ViewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NSLog("ViewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NSLog("ViewWillDisappear")
    }
}
