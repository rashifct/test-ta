//
//  NoodlesViewModel.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import Foundation

class RestaurantViewModel {
    
    private var restaurants = [RestaurantResponseElement]()
    
    func restuarantData(completion: @escaping () -> ()) {
        NetworkService.shared.fetchRestaurants { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.restaurants = listOf
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if restaurants.count != 0 {
            return restaurants.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> RestaurantResponseElement {
        return restaurants[indexPath.row]
    }
}
