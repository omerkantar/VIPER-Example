//
//  BoxCollectionInteractor.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import Foundation


protocol BoxCollectionBusinessLogic {
    func fetchData() -> Void
    func refreshData() -> Void
    func nextPaging() -> Void
    var canPaging: Bool { set get }
}

class BoxCollectionInteractor: BoxCollectionBusinessLogic {
    
    var boxModels: [BoxModel]?
    var presenter: BoxCollectionPresenterDataSource?
    var canPaging: Bool = true
    
    func fetchData() {
        BoxCollectionWorker.getBoxModels { [unowned self] (models) in
            if (self.boxModels == nil) {
                self.boxModels = [BoxModel]()
            }
            self.boxModels! += models
            self.canPaging = models.count >= 15
            self.presenter?.loadedBoxModels(self.boxModels!)
        }
    }
    
    func refreshData() {
        boxModels?.removeAll()
        canPaging = true
    }
    
    func nextPaging() {
        if canPaging {
            fetchData()
        }
    }
}
