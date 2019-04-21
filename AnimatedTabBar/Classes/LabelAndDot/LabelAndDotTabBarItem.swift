//
//  LabelAndDotTabBarItem.swift
//  AnimatedTabBar
//
//  Created by Alberto García-Muñoz on 21/04/2019.
//

import Foundation

public class LabelAndDotTabBarItem: AnimatedTabBarItem {
    public var icon: UIImage
    public var title: String
    public var controller: UIViewController
    
    public init(icon: UIImage, title: String, controller: UIViewController) {
        self.icon = icon
        self.title = title
        self.controller = controller
    }
}
