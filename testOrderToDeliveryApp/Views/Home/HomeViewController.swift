//
//  HomeViewController.swift
//  testOrderToDeliveryApp
//
//  Created by Админ on 22.11.2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let data):
                ProgressHUD.dismiss()
                self?.categories = data.categories ?? []
                self?.categoryCollectionView.reloadData()
                self?.populars = data.populars ?? []
                self?.popularCollectionView.reloadData()
                self?.specials = data.specials ?? []
                self?.chefSpecialCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    // регистрируем ячейку внутри ячейки колекшн вью
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.inditifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.inditifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.inditifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.inditifier)
        
        chefSpecialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.inditifire, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.inditifire)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case chefSpecialCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.inditifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.inditifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.inditifire, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoryCollectionView {
            let controller =  ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            controller.dishName = categories[indexPath.row].id ?? ""
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            // функция заменяющая свич на 9 строк кода в одну линнию. кайф
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
}
