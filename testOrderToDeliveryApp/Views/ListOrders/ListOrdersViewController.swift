//
//  ListOrdersViewController.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 24.11.2022.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        
        .init(id: "id", name: "Борисов Никита", dish: .init(id: "id1", name: "Бурегер бу Дима", description: "Топ продаж ЧД", image: "https://picsum.photos/100/280", calories: 55)),
        .init(id: "id", name: "Bdfy Никита", dish: .init(id: "id1", name: "Lehf", description: "Топ продаж ЧД", image: "https://picsum.photos/100/2656", calories: 55)),
        .init(id: "id", name: "<vddv Никита", dish: .init(id: "id1", name: "Rehf", description: "Топ продаж ЧД", image: "https://picsum.photos/100/565", calories: 55)),
        .init(id: "id", name: "Борисов Никита", dish: .init(id: "id1", name: "Даня повар", description: "Топ продаж ЧД", image: "https://picsum.photos/100/3434", calories: 55)),
        .init(id: "id", name: "IIIDD Никита", dish: .init(id: "id1", name: "Бурегер бу Дима", description: "Топ продаж ЧД", image: "https://picsum.photos/100/5656", calories: 55)),
        .init(id: "id", name: "Борисов Никита", dish: .init(id: "id1", name: "Бурегер бу Дима", description: "Топ продаж ЧД", image: "https://picsum.photos/100/280", calories: 55)),
        .init(id: "id", name: "Борисов Никита", dish: .init(id: "id1", name: "Бурегер бу Дима", description: "Топ продаж ЧД", image: "https://picsum.photos/100/280", calories: 55)),
        .init(id: "id", name: "Борисов Никита", dish: .init(id: "id1", name: "Бурегер бу Дима", description: "Топ продаж ЧД", image: "https://picsum.photos/100/280", calories: 55)),
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Заказы"
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: DishViewTableViewCell.inditifire, bundle: nil), forCellReuseIdentifier: DishViewTableViewCell.inditifire)
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishViewTableViewCell.inditifire, for: indexPath) as! DishViewTableViewCell
        
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiate()
        
        controller.dish = orders[indexPath.row].dish
        
        navigationController?.pushViewController(controller, animated: true)
        
        
        
    }
    
    

}
