//
//  ViewController.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    
    private var restaurantViewModel = RestaurantViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        registerCells()
    }

    private func loadData() {
        restaurantViewModel.restuarantData() { [weak self] in
            self?.restaurantCollectionView.reloadData()
        }
    }
    
    private func registerCells() {
        restaurantCollectionView.register(UINib(nibName: RestaurantCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RestaurantCollectionViewCell.identifier)
    }

}

extension RestaurantViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantViewModel.numberOfRowsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.identifier, for: indexPath) as! RestaurantCollectionViewCell
        
        let restaurants = restaurantViewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(restaurants)
//        cell.setup(noodles: noodles[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "NoodlesViewController") as! NoodlesViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
