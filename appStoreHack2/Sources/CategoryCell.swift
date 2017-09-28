
import UIKit

class CategoryCell: UICollectionViewCell {
    
    var featuredCarsController: FeaturedCarsController?
    
    var carCategory: CarCategory? {
        didSet {
            if let name = carCategory?.name {
                nameLabel.text = name
            }
        }
    }
    
    private let cellId = "carCellId"

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Best New Cars"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let carsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false


        return collectionView
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor .clear

        addSubview(carsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)

        carsCollectionView.dataSource = self
        carsCollectionView.delegate = self

        carsCollectionView.register(CarCell.self, forCellWithReuseIdentifier: cellId)

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerLineView]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": carsCollectionView]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(0)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": carsCollectionView, "v1": dividerLineView, "nameLabel": nameLabel]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = carCategory?.cars?.count {
            return count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CarCell
        cell.car = carCategory?.cars?[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 35)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let car = carCategory?.cars?[indexPath.item]{
            featuredCarsController?.showCarDetailForCar(car: car)
        }
    }
}
