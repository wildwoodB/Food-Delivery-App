//
//  DishDetailViewController.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 23.11.2022.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish :  Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView() {
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        
        /// создаение перменной с именем с функцией отчистки текст филда от лишних пробелов. вышак!
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Пожалуйста введи свое имя!")
            return
        }
        
        print(name)
        
        ProgressHUD.show("Добавляем заказ....")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { result in
            switch result {
            case .success(_):
                ProgressHUD.showSucceed("Заказ добавлен!")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
