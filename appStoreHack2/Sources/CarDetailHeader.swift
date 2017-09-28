
import UIKit

class CarDetailHeader: UICollectionViewCell {

    var car: Car? {
        didSet {
            if let imageName = car?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            nameLabel.text = car?.name
        }
    }

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(imageView)
        addSubview(nameLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.yellow

        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstraintsWithFormat(format: "V:|[v0(150)]", views: imageView)


        addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: nameLabel)
        addConstraintsWithFormat(format: "V:[v0(34)]-8-|", views: nameLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
