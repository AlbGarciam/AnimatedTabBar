//
//  AnimatedTabBarItem.swift
//  AnimatedTabBar
//
//  Created by Alberto García-Muñoz on 21/04/2019.
//

import UIKit

public protocol AnimatedTabBarItem : AnyObject {
    var icon: UIImage { get }
    var selectedIcon: UIImage? { get }
    var title: String { get }
    var controller: UIViewController { get }

    func getView() -> UIView
}

extension AnimatedTabBarItem {
    public var selectedIcon: UIImage? {
        return nil
    }
}
