//
//  BoxCollectionViewCell.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

protocol BoxCollectionViewDataSource {
    var title: String? { set get }
    var date: String? { set get }
    var imageUrl: URL? { set get }
    
    func didSelectItem()
}


class BoxCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
    }
    
    
    func configuration(_ dataSource: BoxCollectionViewDataSource) {
        self.titleLabel.text = dataSource.title
        self.dateLabel.text = dataSource.date
        self.imageView.downloaded(from: dataSource.imageUrl)
    }
    
}
