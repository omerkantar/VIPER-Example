//
//  BoxCollectionBuilder.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit



class BoxCollectionBuilder: VCBuilder {
    
    
    typealias ViewController = BoxCollectionViewController
    
    func make(_ dataPass: Any?) -> BoxCollectionViewController {
        let storyboard = UIStoryboard(name: "Box", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: BoxCollectionViewController.self)) as! BoxCollectionViewController
        let interactor = BoxCollectionInteractor()
        let presenter = BoxCollectionPresenter()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.displayView = vc
        vc.presenter = presenter
        return vc
    }
}
