//
//  MainTabBarController.swift
//  TestAutoTrack
//
//  Created by name name on 2017/07/31.
//  Copyright © 2017年 name name. All rights reserved.
//

import UIKit

//UITabBarControllerを継承
class MainTabBarController: UITabBarController {
    var vc1: PageRootViewController!
    var nav2: UINavigationController = UINavigationController()
    var nav3: UINavigationController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageStoryboard = UIStoryboard.init(name: "PageRootView", bundle: .main)
        let optionStoryboard = UIStoryboard.init(name: "OptionListView", bundle: .main)
        let loginStoryboard = UIStoryboard.init(name: "BeforeLoginView", bundle: .main)
        
        vc1 = pageStoryboard.instantiateViewController(withIdentifier: "PageRootViewController") as! PageRootViewController
        
        let vc2 = optionStoryboard.instantiateViewController(withIdentifier: "OptionListViewController") as! OptionListViewController
        nav2.viewControllers = [vc2]
        
        let vc3 = loginStoryboard.instantiateViewController(withIdentifier: "BeforeLoginViewController") as! BeforeLoginViewController
        nav3.viewControllers = [vc3]
        
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        nav2.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        nav3.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 3)
        
        let myTabs:[UIViewController] = [vc1,nav2,nav3]
        
        self.setViewControllers(myTabs, animated: false)
    }
    
}
