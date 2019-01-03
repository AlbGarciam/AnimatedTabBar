//
//  Utils.swift
//  TabBarTest
//
//  Created by Alberto García-Muñoz on 30/12/2018.
//  Copyright © 2018 Alberto García-Muñoz. All rights reserved.
//

import UIKit

var bottomSafeAreaHeight : CGFloat {
    var bottom : CGFloat = 0
    if #available(iOS 11.0, *) {
        let window = UIApplication.shared.keyWindow
        bottom = window?.safeAreaInsets.bottom ?? 0
    }
    return bottom
}

var heightOfStackView : CGFloat {
    return 49.0
}
