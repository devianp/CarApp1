
import UIKit

class FeaturedCarsViewController: UICollectionViewController {

    private var carCategories: [CarCategory] = CarCategory.sampleCarCategories {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    private weak var carsCollectionView: UICollectionView? {
        didSet {
            self.carsCollectionView?.register(TopCarCell.self, forCellWithReuseIdentifier: String(describing: TopCarCell.self))
            self.carsCollectionView?.dataSource = self
            self.carsCollectionView?.delegate = self
            self.carsCollectionView?.reloadData()
        }
    }

    private weak var carsPageControl: UIPageControl?

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.title = "Home"
    }

    required init?(coder decoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(TopCategoryCell.self, forCellWithReuseIdentifier: String(describing: TopCategoryCell.self))
        self.collectionView?.register(CarCell.self, forCellWithReuseIdentifier: String(describing: CarCell.self))
    }
}

extension FeaturedCarsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            switch indexPath.section {
            case 0:
                return CGSize(width: collectionView.frame.width, height: 250.0)
            default:
                return CGSize(width: collectionView.frame.width, height: 60.0)
            }
        }
        else if collectionView == carsCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 30)
        }
        fatalError()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return self.carCategories.count
        }
        else if collectionView == carsCollectionView {
            return 1
        }
        fatalError()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            switch section {
            case 0:
                return 1
            default:
                return self.carCategories[section].cars.count
            }
        }
        else if collectionView == carsCollectionView {
            return self.carCategories[section].cars.count
        }
        fatalError()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TopCategoryCell.self), for: indexPath) as! TopCategoryCell
                cell.carCategory = carCategories[indexPath.section]

                self.carsCollectionView = cell.carsCollectionView
                self.carsPageControl = cell.pageControl

                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CarCell.self), for: indexPath) as! CarCell
                cell.car = self.carCategories[indexPath.section].cars[indexPath.item]
                return cell
            }
        }
        else if collectionView == carsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TopCarCell.self), for: indexPath) as! TopCarCell
            cell.car = self.carCategories[indexPath.section].cars[indexPath.item]
            return cell
        }
        fatalError()
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let car = self.carCategories[indexPath.section].cars[indexPath.item]
        let viewController = CarDetailViewController(car: car)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView === carsCollectionView {
            self.carsPageControl?.currentPage = Int(CGFloat(self.carsPageControl?.numberOfPages ?? 0) * ((scrollView.contentOffset.x + (scrollView.frame.size.width / 2.0)) / scrollView.contentSize.width))
        }
    }
}
