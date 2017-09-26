//
//  ViewController.swift
//  appStoreHack2
//
//  Created by Devian Patel on 12/05/2017.
//  Copyright © 2017 Devian Patel. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let cellId = "cellId"
    private let largeCellId = "LargeCellId"
    private let topCellId = "topCellId"
    

    
    // create a way to power collection view by number of categories
    var appCategories: [AppCategory]?
    
    
    // test 1
    var topAppCategories: [AppCategory]?

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change title at top
        navigationItem.title = "Home"
        
        appCategories = AppCategory.sampleAppCategories()

        collectionView?.backgroundColor = .white
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        collectionView?.register(topCategoryCell.self, forCellWithReuseIdentifier: topCellId)
        

    }
    
    // segue into new controller
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        
//    }
    
    func showAppDetailForApp(app: App) {
        // dummy view controller for now
        let layout = UICollectionViewFlowLayout()
        let appDetailController = AppDetailController(collectionViewLayout: layout)
        appDetailController.app = app
        navigationController?.pushViewController(appDetailController, animated: true)
        print("selected")
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellId, for: indexPath) as! topCategoryCell
            
            cell.appCategory = appCategories?[indexPath.item]
            cell.featuredAppsController = self

            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        cell.featuredAppsController = self
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        // change height of cell 1
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 250)
        }
        
        return CGSize(width: view.frame.width, height: 300)
    }
    


}




// create different cell for cell 0, subclassing catgeory cell

class LargeCategoryCell: CategoryCell {
    
}





