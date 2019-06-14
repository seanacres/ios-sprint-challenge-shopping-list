//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Sean Acres on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = shoppingItem else { return }
        shoppingItemNameLabel.text = item.name
        hasBeenAddedLabel.text = item.hasBeenAdded ? "Added" : "Not Added"
        shoppingItemImageView.image = UIImage(named: item.name)
    }
}
