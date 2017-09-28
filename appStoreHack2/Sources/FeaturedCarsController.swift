
import UIKit

class FeaturedCarsController: UICollectionViewController {

    private let cellId = "cellId"
    private let topCellId = "topCellId"

    var carCategories: [CarCategory]?
    var topCarCategories: [CarCategory]?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        
        carCategories = CarCategory.sampleCarCategories()

        collectionView?.backgroundColor = .white
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(TopCategoryCell.self, forCellWithReuseIdentifier: topCellId)
    }
}

extension FeaturedCarsController {

    func showCarDetailForCar(car: Car) {
        let layout = UICollectionViewFlowLayout()
        let carDetailController = CarDetailController(collectionViewLayout: layout)
        carDetailController.car = car
        navigationController?.pushViewController(carDetailController, animated: true)
    }
}

extension FeaturedCarsController: UICollectionViewDelegateFlowLayout {

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
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 250)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
}
