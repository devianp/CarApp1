
import UIKit

class TopCarCell: UICollectionViewCell {

    var car: Car? {
        didSet {
            if let name = car?.name {
                textView.text = name
            }
            if let imageName = car?.imageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "2")
        iv.backgroundColor = .yellow
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample"
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.textAlignment = .center
        tv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        tv.backgroundColor = UIColor(red: 242/255, green: 241/255, blue: 239/255, alpha: 1)
        return tv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.red

        addSubview(imageView)
        addSubview(textView)

        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
