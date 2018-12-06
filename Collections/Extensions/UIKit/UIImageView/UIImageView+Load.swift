//
//  UIImageView+Load.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

extension UIImageView {

    func downloaded(from url: URL?, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        image = nil
        guard let url = url else {
            return
        }
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    

}
