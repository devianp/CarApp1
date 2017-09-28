
import UIKit

class TopAppCell: UICollectionViewCell {

    // test 3
    var app: App? {
        didSet {
            if let name = app?.name {
                textView.text = name
            }

            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }

        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "2")
        iv.backgroundColor = .yellow
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()


    // use namelabel in app store
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample"
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.textAlignment = .center

        // push text down
        tv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        tv.backgroundColor = UIColor(colorLiteralRed: 242/255, green: 241/255, blue: 239/255, alpha: 1)
        return tv
    }()


    func setupViews() {
        backgroundColor = UIColor.red

        addSubview(imageView)
        addSubview(textView)

        //        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)

        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)

        textView.anchorToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

    }

}
