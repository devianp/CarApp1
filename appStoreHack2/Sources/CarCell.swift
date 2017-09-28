
import UIKit

class CarCell: UICollectionViewCell {

    var car: Car? {
        didSet {
            nameLabel.text = car?.name
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Porsche 2"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 1
        return label
    }()


    func setupViews() {
        addSubview(nameLabel)

        backgroundColor = UIColor(white: 0.9, alpha: 0.4)

        nameLabel.frame = CGRect(x: 10, y: 0, width: frame.width, height: frame.height)



    }

}
