//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Sean Acres on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    private(set) var shoppingList: [ShoppingItem] = []
    let shouldLoadList = UserDefaults.standard.bool(forKey: .shouldLoadShoppingList)
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    init() {
        if shouldLoadList {
            loadFromPersistentStore()
        } else {
            initList()
        }
    }
    
    func addToCart(item: ShoppingItem, hasBeenAdded: Bool) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList[index].hasBeenAdded = hasBeenAdded
        saveToPersistentStore()
    }
    
    func initList() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            shoppingList.append(ShoppingItem(name: item))
        }
        UserDefaults.standard.set(true, forKey: .shouldLoadShoppingList)
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Saving failed with \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Loading failed with \(error)")
        }
    }
    
}
