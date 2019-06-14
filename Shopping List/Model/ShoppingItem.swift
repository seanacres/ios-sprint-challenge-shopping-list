//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Sean Acres on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var name: String
    var hasBeenAdded: Bool
    
    init(name: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}
