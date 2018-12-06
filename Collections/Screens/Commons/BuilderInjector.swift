//
//  BuilderInjector.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit


protocol VCBuilder {
    associatedtype ViewController: UIViewController
    func make(_ dataPass: Any?) -> ViewController
}
