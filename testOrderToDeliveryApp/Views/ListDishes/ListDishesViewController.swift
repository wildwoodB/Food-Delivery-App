//
//  ListDishesViewController.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 24.11.2022.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Бурегер бу Дима", description: "Топ продаж ЧД", image: "https://picsum.photos/100/280", calories: 55),
        .init(id: "id1", name: "БурегерБУ ЧИИИИз", description: "Топ продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧДТоп продаж ЧД", image: "https://picsum.photos/100/210", calories: 121),
        .init(id: "id1", name: "Бургер", description: "Топ продаж ЧД", image: "https://picsum.photos/100/260", calories: 345)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        registerCell()
        
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
