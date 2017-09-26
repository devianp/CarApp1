//
//  CategoryCell.swift
//  appStoreHack2
//
//  Created by Devian Patel on 12/05/2017.
//  Copyright © 2017 Devian Patel. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var featuredAppsController: FeaturedAppsController?
    
    var appCategory: AppCategory? {
        didSet {
            if let name = appCategory?.name {
                nameLabel.text = name
            }
        }
    }
    
    private let cellId = "appCellId"

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // category name label
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // add collection view within cell
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return collectionView
    }()
    
    // divider line
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        backgroundColor = UIColor .clear
        
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)

        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self

        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerLineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        
        // name label hidden using 0, previously 30
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(0)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView, "v1": dividerLineView, "nameLabel": nameLabel]))
    }
    
    // number of items within collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 8
        if let count = appCategory?.apps?.count {
            return count
        }
        return 0    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    // change height of cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 35)

    }
    
    // margins for collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appCategory?.apps?[indexPath.item]{
            featuredAppsController?.showAppDetailForApp(app: app)
        }
    }
    
    
}


// class for cells
class AppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            nameLabel.text = app?.name
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



//
//class AppCell: UICollectionViewCell {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let imageView: UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(named: "2")
//        iv.backgroundColor = .blue
//        iv.contentMode = .scaleAspectFill
//        iv.clipsToBounds = true
//        return iv
//    }()
//    
//    
//    // use namelabel in app store
//    let textView: UITextView = {
//        let tv = UITextView()
//        tv.text = "Sample"
//        tv.isEditable = false
//        tv.font = UIFont.systemFont(ofSize: 14)
//        tv.textAlignment = .center
//        
//        // push text down
//        tv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
//        tv.backgroundColor = UIColor(colorLiteralRed: 242/255, green: 241/255, blue: 239/255, alpha: 1)
//        return tv
//    }()
//    
//    
//    func setupViews() {
//        backgroundColor = UIColor.red
//        
//        addSubview(imageView)
//        addSubview(textView)
//        
//        //        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
//        
//        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
//        
//        textView.anchorToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
//        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
//        
//    }
//    
//}



