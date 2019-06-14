//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Sean Acres on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    var shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let submitOrderVC = segue.destination as? SubmitOrderViewController else { return }
        submitOrderVC.shoppingItemController = shoppingItemController
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeaderCollectionReusableView else { return UICollectionReusableView()}
        if indexPath.section == 0 {
            sectionHeader.sectionHeader.text = "Added Items"
        } else {
            sectionHeader.sectionHeader.text = "Not Added Items"
        }
        
        return sectionHeader
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.addedItems.count
        } else {
            return shoppingItemController.notAddedItems.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.shoppingItem = itemFor(indexPath: indexPath)
    
        return cell
    }
    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemController.addToCart(item: itemFor(indexPath: indexPath))
        collectionView.reloadData()
    }
    
    func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.addedItems[indexPath.row]
        } else {
            return shoppingItemController.notAddedItems[indexPath.row]
        }
    }
}
