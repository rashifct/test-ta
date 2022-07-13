//
//  RestaurantCollectionViewCell.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: RestaurantCollectionViewCell.self)
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var varietyLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var noodlesImageView: UIImageView!
    
    func setCellWithValuesOf(_ restaurants: RestaurantResponseElement) {
        updateUI(brandName: restaurants.brand, variety: restaurants.variety, country: restaurants.country)
    }
    
    private func updateUI(brandName: String, variety: String, country: String) {
        
        self.brandNameLabel.text = brandName
        self.varietyLabel.text = variety
        self.starsLabel.text = country
        
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.noodlesImageView.image = image
                }
            }
        }.resume()
    }
}
