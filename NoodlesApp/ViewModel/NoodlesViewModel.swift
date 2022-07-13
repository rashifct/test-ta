//
//  NoodlesViewModel.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import Foundation

class NoodlesViewModel {
    
    private var noodlesImages = [NoodlesImageResponseElement]()
    
    func noodlesData(completion: @escaping () -> ()) {
        NetworkService.shared.fetchNoodles { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.noodlesImages = listOf
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if noodlesImages.count != 0 {
            return noodlesImages.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> NoodlesImageResponseElement {
        return noodlesImages[indexPath.row]
    }
}
