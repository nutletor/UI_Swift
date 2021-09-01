//
//  TagCell.swift
//  UI_Swift
//
//  Created by PxLand on 2021/9/1.
//  Copyright © 2021 nutletor. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    let tagLbl: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.94, green: 0.96, blue: 0.98, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0.42, green: 0.61, blue: 0.78, alpha: 1).cgColor
        label.layer.cornerRadius = 4
        label.textColor = UIColor(red: 0.42, green: 0.61, blue: 0.78, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
//    override func prepareForReuse() {
//        makeUI()
//    }
    
    func makeUI() {
        contentView.addSubview(tagLbl)
        tagLbl.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(100)
//            make.height.equalTo(28)
            make.edges.equalToSuperview()
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super .preferredLayoutAttributesFitting(layoutAttributes)
        if layoutAttributes.indexPath.item == 1 {
            layoutAttributes.isHidden = true
        }
        return layoutAttributes
    }
}
