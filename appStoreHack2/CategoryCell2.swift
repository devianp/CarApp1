//
//  CategoryCell2.swift
//  appStoreHack2
//
//  Created by Devian Patel on 17/05/2017.
//  Copyright © 2017 Devian Patel. All rights reserved.
//

import UIKit

// create new cell using
class topCategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var featuredAppsController: FeaturedAppsController?

    
    //test 2
    var appCategory: AppCategory? {
        didSet {
            if let name = appCategory?.name {
                nameLabel.text = name
            }
        }
    }
    
    
    
    private let topCellId = "appCellId"

    
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
    

    
    
    let appsCollectionView: UICollectionView = {
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
        
        addSubview(appsCollectionView)
        addSubview(nameLabel)
        
        // test page control
        addSubview(pageControl)

        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        // add app cell to collection view
        appsCollectionView.register(topAppCell.self, forCellWithReuseIdentifier: topCellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))

        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView, "nameLabel": nameLabel]))
        
        pageControl.anchorToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

    
    }
    
    // how many cells to return
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategory?.apps?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellId, for: indexPath) as! topAppCell
        cell.app = appCategory?.apps?[indexPath.item]
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
        if let app = appCategory?.apps?[indexPath.item]{
            featuredAppsController?.showAppDetailForApp(app: app)
        }
    }
    
    
}


class topAppCell: UICollectionViewCell {
    
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
