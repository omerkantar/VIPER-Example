//
//  BoxCollectionView.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

class BoxCollectionView: UICollectionView {
    
    let cellIdentifier = String(describing: BoxCollectionViewCell.self)
    
    private var cellPresentations: [BoxCollectionCellPresentation]?
    
    private var cellSize: CGSize = .zero
    
    private let minimumLineSpacing: CGFloat = 3.0
    private let minimumInteritemSpacing: CGFloat = 3.0

    
    // MARK: - Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource = self
        self.delegate = self
        self.contentInset = UIEdgeInsets(top: 20.0, left: 6.0, bottom: 20.0, right: 6.0)
        self.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    
    func configuration(cellPresentations: [BoxCollectionCellPresentation]) {
        self.cellPresentations = cellPresentations
        self.reloadData()
    }
}


// MARK: - UICollectionViewDataSource
extension BoxCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellPresentations?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? BoxCollectionViewCell,
            let dataSource = cellPresentations?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configuration(dataSource)
        return cell
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension BoxCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard cellSize == .zero else {
            return cellSize
        }
        
        let width = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right - minimumInteritemSpacing
        
        let cellWidth: CGFloat = width / 2.0
        let cellHeight: CGFloat = cellWidth * 3/2
        cellSize = CGSize(width: cellWidth, height: cellHeight)
        return cellSize
    }

}

// MARK: - UICollectionViewDelegate
extension BoxCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        cellPresentations?[indexPath.row].didSelectItem()        
    }
}
