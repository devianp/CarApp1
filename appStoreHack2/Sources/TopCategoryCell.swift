
import UIKit

// create new cell using
class TopCategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var featuredCarsController: FeaturedCarsController?

    
    //test 2
    var carCategory: CarCategory? {
        didSet {
            if let name = carCategory?.name {
                nameLabel.text = name
            }
        }
    }
    
    
    
    private let topCellId = "carCellId"

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // top name label that we dont need
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    
    let carsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        layout.minimumLineSpacing = 0
        //        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    
    // test page control
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pc.numberOfPages = 8
        
        return pc
        
    }()
    

    
    func setupViews() {
        backgroundColor = UIColor(white: 0.9, alpha: 0.4)
        
        addSubview(carsCollectionView)
        addSubview(nameLabel)
        
        // test page control
        addSubview(pageControl)

        
        carsCollectionView.dataSource = self
        carsCollectionView.delegate = self
        
        // add app cell to collection view
        carsCollectionView.register(TopCarCell.self, forCellWithReuseIdentifier: topCellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": carsCollectionView]))

        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": carsCollectionView, "nameLabel": nameLabel]))
        
        pageControl.anchorToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

    
    }
    
    // how many cells to return
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = carCategory?.cars?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellId, for: indexPath) as! TopCarCell
        cell.car = carCategory?.cars?[indexPath.item]
        return cell
    }
    
    // height of cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height - 30)
    }
    
    
    // test page control
    // for page view: gives numbers in console
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // gives us the memory value for the CGPoints
        let pageNumber = Int(targetContentOffset.pointee.x / frame.width)
        pageControl.currentPage = pageNumber
//        print(pageNumber)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let car = carCategory?.cars?[indexPath.item]{
            featuredCarsController?.showCarDetailForCar(car: car)
        }
    }
    
    
}
