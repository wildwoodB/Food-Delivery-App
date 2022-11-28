//
//  ListDishesViewController.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 24.11.2022.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var dishes: [Dish] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        registerCell()
        ProgressHUD.show()
        
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] result in
            switch result {
            case .success(let data):
                self?.dishes = data
                self?.tableView.reloadData()
                ProgressHUD.showSucceed()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    // регистрации ячейки внутри тайбл вью контроллера
    private func registerCell() {
        tableView.register(UINib(nibName: DishViewTableViewCell.inditifire, bundle: nil), forCellReuseIdentifier: DishViewTableViewCell.inditifire)
    }
}

//расширение для контролера с расположением ячеек
extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishViewTableViewCell.inditifire, for: indexPath) as! DishViewTableViewCell
        //cell.backgroundColor = .black
        cell.setup(dish: dishes[indexPath.row] )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
