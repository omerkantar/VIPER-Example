//
//  BoxCollectionPresenter.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

// MARK: - Presenter UI Logics

protocol BoxCollectionPresenterDataSource {
    func loadedBoxModels(_ models: [BoxModel])
}

protocol BoxCollectionPresenterLogic {
    func fetchData()
    func refreshData()
    func nextPaging()
}

class BoxCollectionPresenter: BoxCollectionPresenterDataSource, BoxCollectionPresenterLogic {
    
    var displayView: BoxCollectionViewDisplayLogic?
    var interactor: BoxCollectionBusinessLogic?
    
    var cellPresentations: [BoxCollectionCellPresentation]? = nil
    
    func loadedBoxModels(_ models: [BoxModel]) {
        guard let _ = cellPresentations else {
            self.cellPresentations = [BoxCollectionCellPresentation]()
            loadedBoxModels(models)
            return
        }
        
        let presentations = models.compactMap(BoxCollectionCellPresentation.init)
        self.cellPresentations! += presentations
        self.displayView?.presenterDidLoaded(self.cellPresentations!)
        
    }
    
    func fetchData() {
        interactor?.fetchData()
    }
    
    func refreshData() {
        interactor?.refreshData()
    }
    
    func nextPaging() {
        guard let interactor = interactor, interactor.canPaging else { return }
        interactor.nextPaging()
    }
}



class BoxCollectionCellPresentation: BoxCollectionViewDataSource  {
    
    
    
    var model: BoxModel?
    var title: String?
    var date: String?
    var imageUrl: URL?
    
    init(model: BoxModel) {
        self.title = model.name
        // Formatter cevrilecek
        self.date = model.date
        self.imageUrl = URL(string: model.imageUrl ?? "")
        self.model = model
    }
    
    
    func didSelectItem() {
        
    }
}
