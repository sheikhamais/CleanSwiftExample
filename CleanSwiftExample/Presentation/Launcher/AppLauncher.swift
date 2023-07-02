//
//  AppLauncher.swift
//  CleanSwiftExample
//
//  Created by Pro on 01/07/2023.
//

import UIKit

class AppLauncher {
    
    private init() {}
    
    static func start(with window: UIWindow) {
     
        let vc = SplashViewController.create()
        let appNav = UINavigationController(rootViewController: vc)
        appNav.navigationBar.isHidden = true
        
        window.rootViewController = appNav
        window.makeKeyAndVisible()
    }
}
