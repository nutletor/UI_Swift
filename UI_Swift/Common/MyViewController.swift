//
//  MyViewController.swift
//  UI_Swift
//
//  Created by PxLand on 2021/8/25.
//  Copyright © 2021 nutletor. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

class MyViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
//    let pushBtn = UIButton()
//
//    let pushBtn: UIButton = {
//        let button = UIButton()
//        return button
//    }()
        
    lazy var pushBtn: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Push", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customUI()
    }
    
    func customUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(pushBtn)
        pushBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        pushBtn.rx.tap
//            .bind {
//                print("push")
//            }
            .bind(onNext: { [weak self] in
                self?.navigationController?.pushViewController(ViewControllerII(), animated: true)
            })
            .disposed(by: disposeBag)
    }
}
