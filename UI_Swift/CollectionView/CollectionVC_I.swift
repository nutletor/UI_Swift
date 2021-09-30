//
//  CollectionVC_I.swift
//  UI_Swift
//
//  Created by PxLand on 2021/9/1.
//  Copyright © 2021 nutletor. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TagCell"

class CollectionVC_I: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
//    var collectionView: UICollectionView
//
//    var collectLayout: UICollectionViewFlowLayout
    
    let collectLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 77, height: 28)
        return layout
    }()

    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = UIColor.orange
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return collectionView
    }()
    
    
    
    lazy var dataAry = ["xx","xxx","xxxx"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectLayout = UICollectionViewFlowLayout()
//        collectLayout.estimatedItemSize = CGSize(width: 77, height: 28)
//
//        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: collectLayout)
//        collectionView.backgroundColor = UIColor.orange
//        collectionView.register(TagCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = collectLayout
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(250)
        }
    }
    
    //MARK: Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let tagCell = cell as! TagCell
        tagCell.tagLbl.text = dataAry[indexPath.item]
        return cell
    }

}
