
import UIKit

class CarCell: UICollectionViewCell {

    var car: Car? {
        didSet {
            self.nameLabel.text = self.car?.name
        }
    }

    private let nameLabel: UILabel

    override init(frame: CGRect) {
        self.nameLabel = UILabel(frame: .zero)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.font = .preferredFont(forTextStyle: .body)

        super.init(frame: frame)

        self.backgroundColor = UIColor(white: 0.9, alpha: 0.4)
        self.addSubview(self.nameLabel)

        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            ])
    }

    required init?(coder decoder: NSCoder) {
        fatalError()
    }
}
