//
//  CollectionViewHelper.swift
//  Note It
//
//  Created by Mert Tecimen on 21.08.2022.
//

import Foundation
import UIKit

protocol CollectionViewHelperDelegate: AnyObject{
    func rowSelected(for name: String)
}

class CollectionViewHelper: NSObject{
    weak var collectionView: UICollectionView?
    weak var delegate: CollectionViewHelperDelegate?
    
    private var data: [String] = ["Appointments", "Birthdays", "Chores", "Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"]
    
    private var selectedString: String?
    
    init(collectionView: UICollectionView){
        super.init()
        self.collectionView = collectionView
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
        
        register()
    }
    
    
    
    func register(){
        self.collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
    }
    
    func setData(name: String?){
        selectedString = name
        DispatchQueue.main.async { [unowned self] in
            collectionView?.reloadData()
        }
    }
    
}

extension CollectionViewHelper: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.rowSelected(for: data[indexPath.item])
    }
}

extension CollectionViewHelper: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage(named: data[indexPath.item])
        cell.imageView.tintColor = .orange
        cell.backgroundColor = .clear
        
        if selectedString == data[indexPath.item]{
            cell.backgroundColor = .gray.withAlphaComponent(0.5)
        } else {
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    
}
