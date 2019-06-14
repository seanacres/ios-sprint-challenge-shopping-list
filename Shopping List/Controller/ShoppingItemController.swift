//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Sean Acres on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var shoppingList: [ShoppingItem] {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        var itemList:[ShoppingItem] = []
        for item in itemNames {
            itemList.append(ShoppingItem(name: item))
        }
        
        return itemList
    }
    
}
