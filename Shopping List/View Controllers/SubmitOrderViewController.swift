//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Sean Acres on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {

    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var shopperNameTextField: UITextField!
    @IBOutlet weak var shopperAddressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
    func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        var itemCount = 0
        for item in shoppingItemController.shoppingList {
            if item.hasBeenAdded {
                itemCount += 1
            }
        }
        itemsInCartLabel.text = "You currently have \(itemCount) items in your shopping list:"
    }
    
    func showAlert() {
        guard let name = shopperNameTextField.text, let address = shopperAddressTextField.text else { return }
        let alert = UIAlertController(title: "Delivery for \(name)", message: "To be delivered to \(address) in 15 minutes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
