//
//  BoxCollectionWorker.swift
//  Collections
//
//  Created by omer kantar on 6.12.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

typealias BoxModelNetworkCompletion = (_ models: [BoxModel]) -> Void
class BoxCollectionWorker {
    
    static func getBoxModels(_ completion: @escaping BoxModelNetworkCompletion) {
        let random = arc4random()%20 + 10
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (_) in
            var list = [BoxModel]()
            for i in 0..<random {
                let model = BoxModel(id: Int(i), name: "name", detail: "detail", date: "01/01/19", imageUrl: "https://source.unsplash.com/random")
                list.append(model)
            }
            completion(list)
        }
    }

}
