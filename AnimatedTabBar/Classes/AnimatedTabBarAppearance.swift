//
//  SoundTabBarAppearance.swift
//  TabBarTest
//
//  Created by Alberto García-Muñoz on 23/12/2018.
//  Copyright © 2018 Alberto García-Muñoz. All rights reserved.
//

import Foundation
import UIKit

open class AnimatedTabBarAppearance {
    public static let shared : AnimatedTabBarAppearance = AnimatedTabBarAppearance()
    
    /// Animation duration
    open var animationDuration: TimeInterval = 1.5
    
    /// Dot color
    open var dotColor: UIColor = UIColor(red: 5/255,
                                           green: 9/255,
                                           blue: 80/255,
                                           alpha: 1)
    
    /// Text color in tabbar
    open var textColor: UIColor = UIColor(red: 5/255,
                                            green: 9/255,
                                            blue: 80/255,
                                            alpha: 1)
    
    /// Text font in tabbar
    open var textFont: UIFont = UIFont(name: "AppleSDGothicNeo-Bold", size: 10) ?? .boldSystemFont(ofSize: 10)
    
    /// Background color
    open var backgroundColor: UIColor = .white
    
    /// Pops to root if true
    open var popsToRoot: Bool = true
}
