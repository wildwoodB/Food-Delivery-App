//
//  ListOrdersViewController.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 24.11.2022.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Заказы"
        registerCell()
        ProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self] result in
            switch result {
            case .success(let data):
                self?.orders = data
                self?.tableView.reloadData()
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
