//
//  CommonUIView.swift
//  TabBarTest
//
//  Created by Alberto García-Muñoz on 23/12/2018.
//  Copyright © 2018 Alberto García-Muñoz. All rights reserved.
//

import UIKit

open class CommonUIView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
    }
}
