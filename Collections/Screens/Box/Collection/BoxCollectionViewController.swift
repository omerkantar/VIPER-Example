//
//  CollectionViewController.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

protocol BoxCollectionViewDisplayLogic {
    func presenterDidLoaded(_ presentation: [BoxCollectionCellPresentation]) -> Void
}

class BoxCollectionViewController: UIViewController, BoxCollectionViewDisplayLogic {
    
    
    
    @IBOutlet weak var collectionView: BoxCollectionView!
    
    var presenter: BoxCollectionPresenterLogic?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
    }
    
    func presenterDidLoaded(_ presentation: [BoxCollectionCellPresentation]) {
        collectionView.configuration(cellPresentations: presentation)
    }
}



