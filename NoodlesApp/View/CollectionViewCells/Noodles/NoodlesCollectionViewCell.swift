//
//  NoodlesCollectionViewCell.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import UIKit

class NoodlesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: NoodlesCollectionViewCell.self)

    @IBOutlet weak var noodlesImageView: UIImageView!
    
    func setCellWithValuesOf(_ noodles: NoodlesImageResponseElement) {
        updateUI(imageView: noodles.image)
    }
    
    private func updateUI(imageView: String) {
        getImageDataFrom(url: imageView.asUrl!)
        
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
