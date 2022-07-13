//
//  NoodlesViewController.swift
//  NoodlesApp
//
//  Created by Rashif on 12/07/22.
//

import UIKit

class NoodlesViewController: UIViewController {

    @IBOutlet weak var noodlesCollectionView: UICollectionView!
    
    private var noodlesViewModel = NoodlesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        loadData()

        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        noodlesViewModel.noodlesData { [weak self] in
            self?.noodlesCollectionView.reloadData()
        }
    }
    
    private func registerCells() {
        noodlesCollectionView.register(UINib(nibName: NoodlesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: NoodlesCollectionViewCell.identifier)
    }

}

extension NoodlesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noodlesViewModel.numberOfRowsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoodlesCollectionViewCell.identifier, for: indexPath) as! NoodlesCollectionViewCell
        
        let noodles = noodlesViewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(noodles)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
}
