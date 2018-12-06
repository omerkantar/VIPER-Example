//
//  AppRouter.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

class Router {
    
    var window: UIWindow?
    
    func start() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.layer.masksToBounds = true
        window?.layer.cornerRadius = 3.0
        window?.backgroundColor = .orange
        window?.rootViewController = BoxCollectionBuilder().make(nil)
        window?.makeKeyAndVisible()
    }
}
