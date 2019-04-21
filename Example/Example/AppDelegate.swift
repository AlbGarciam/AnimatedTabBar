//
//  AppDelegate.swift
//  AnimatedTabBar
//
//  Created by alb.garciam@gmail.com on 01/03/2019.
//  Copyright (c) 2019 alb.garciam@gmail.com. All rights reserved.
//

import UIKit
import AnimatedTabBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var items: [AnimatedTabBarItem] = [BubbleTabBarItem(title: "New", controller: UIViewController(),
                                  icon: UIImage(named: "thunder") ?? UIImage()),
                 LabelAndDotTabBarItem(title: "New", controller: UIViewController(),
                                       icon: UIImage(named: "thunder") ?? UIImage()),
                 LabelAndDotTabBarItem(title: "New", controller: UIViewController(),
                                       icon: UIImage(named: "thunder") ?? UIImage())]
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = AnimatedTabBarController()
        controller.delegate = self
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

extension AppDelegate : AnimatedTabBarDelegate {
    func initialIndex(_ tabBar: AnimatedTabBar) -> Int? {
        return 1
    }
    
    var numberOfItems: Int {
        return items.count
    }
    
    func tabBar(_ tabBar: AnimatedTabBar, itemFor index: Int) -> AnimatedTabBarItem {
        return items[index]
    }
}

