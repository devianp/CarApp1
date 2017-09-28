
import UIKit

class FeaturedCarsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let cellId = "cellId"
    private let largeCellId = "LargeCellId"
    private let topCellId = "topCellId"
    

    
    // create a way to power collection view by number of categories
    var carCategories: [CarCategory]?
    
    
    // test 1
    var topCarCategories: [CarCategory]?

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change title at top
        navigationItem.title = "Home"
        
        carCategories = CarCategory.sampleCarCategories()

        collectionView?.backgroundColor = .white
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        collectionView?.register(TopCategoryCell.self, forCellWithReuseIdentifier: topCellId)
        

    }
    
    // segue into new controller
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        
//    }
    
    func showCarDetailForCar(car: Car) {
        // dummy view controller for now
        let layout = UICollectionViewFlowLayout()
        let carDetailController = CarDetailController(collectionViewLayout: layout)
        carDetailController.car = car
        navigationController?.pushViewController(carDetailController, animated: true)
        print("selected")
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellId, for: indexPath) as! TopCategoryCell
            
            cell.carCategory = carCategories?[indexPath.item]
            cell.featuredCarsController = self

            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.carCategory = carCategories?[indexPath.item]
        cell.featuredCarsController = self
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = carCategories?.count {
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
