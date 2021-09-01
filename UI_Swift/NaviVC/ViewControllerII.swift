//
//  ViewControllerII.swift
//  UI_Swift
//
//  Created by PxLand on 2021/8/11.
//  Copyright © 2021 nutletor. All rights reserved.
//

import UIKit

class ViewControllerII: MyViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        let labelI = UILabel()
        labelI.backgroundColor = UIColor.orange
        labelI.text = "Middle Land 2333333"
        labelI.textAlignment = NSTextAlignment.center
        labelI.textColor = UIColor.darkText
        labelI.font = UIFont.systemFont(ofSize: 14)
//        labelI.font = UIFont.italicSystemFont(ofSize: 14)
        labelI.numberOfLines = 0
//        labelI.lineBreakMode = NSLineBreakMode.byTruncatingTail
        view.addSubview(labelI)
        labelI.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        let textFldI = UITextField()
        textFldI.backgroundColor = UIColor.yellow
        textFldI.borderStyle = UITextField.BorderStyle.roundedRect
        textFldI.placeholder = "携番を入力してください"
        textFldI.isSecureTextEntry = true
        textFldI.keyboardType = UIKeyboardType.default
        textFldI.returnKeyType = UIReturnKeyType.default
        textFldI.clearButtonMode = UITextField.ViewMode.whileEditing
        view.addSubview(textFldI)
        textFldI.snp.makeConstraints { make in
            make.top.equalTo(labelI)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        
        
    }
    
    
}
