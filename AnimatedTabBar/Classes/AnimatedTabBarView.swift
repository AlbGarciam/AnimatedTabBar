//
//  AnimatedTabBarView.swift
//  AnimatedTabBar
//
//  Created by Alberto García-Muñoz on 21/04/2019.
//

import UIKit

protocol AnimatedTabBarViewDelegate: AnyObject {
    func didTapped(on item: AnimatedTabBarView)
}

protocol AnimatedTabBarView : AnyObject {
    var delegate: AnimatedTabBarViewDelegate? { get set }
    var associatedController: UIViewController? { get }
    var isSelected : Bool { get set }
    var position: Int { get set }
}
