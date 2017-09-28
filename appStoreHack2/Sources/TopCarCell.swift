
import UIKit

class TopCarCell: UICollectionViewCell {

    var car: Car? {
        didSet {
            self.imageView.image = (self.car?.imageName).flatMap { UIImage(named: $0) }
            self.nameLabel.text = self.car?.name
        }
    }

    private let imageView: UIImageView
    private let nameLabel: UILabel

    override init(frame: CGRect) {
        self.imageView = UIImageView(frame: .zero)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true

        self.nameLabel = UILabel(frame: .zero)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.font = .preferredFont(forTextStyle: .body)
        self.nameLabel.textAlignment = .center

        super.init(frame: frame)

        self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)

        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.nameLabel.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
