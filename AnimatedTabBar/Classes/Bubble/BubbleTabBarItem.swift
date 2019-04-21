//
//  BubbleTabBarItem.swift
//  AnimatedTabBar
//
//  Created by Alberto García-Muñoz on 21/04/2019.
//

import UIKit

public class BubbleTabBarItem: AnimatedTabBarItem {
    
    public let icon: UIImage
    public let selectedIcon: UIImage
    public let title: String
    public let controller: UIViewController
    public let tintColor: UIColor
    public let backgroundColor: UIColor
    
    public init(title: String, controller: UIViewController, icon: UIImage, selectedIcon: UIImage? = nil, tintColor: UIColor = AnimatedTabBarAppearance.shared.textColor, backgroundColor: UIColor? = nil) {
        self.icon = icon
        self.selectedIcon = selectedIcon ?? icon
        self.title = title
        self.controller = controller
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor ?? tintColor.withAlphaComponent(0.1)
    }
    
    public func getView() -> UIView {
        let view = BubbleTabBarView()
        view.setupView(model: self)
        return view
    }
}
