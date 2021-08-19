//
//  ViewControllerI.swift
//  UI_Swift
//
//  Created by PxLand on 2021/8/11.
//  Copyright © 2021 nutletor. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

class ViewControllerI: UIViewController {
    
    var disposeBag = DisposeBag()
    
//    let pushBtn: UIButton = {
//        let button = UIButton()
//        return button
//    }()
    
//    lazy var pushBtn = UIButton()
    lazy var pushBtn: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        是否隐藏导航栏
//        navigationController?.navigationBar.isHidden = true

        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        改变NaviVC导航栏风格，间接改变当前VC状态栏字体颜色
        navigationController?.navigationBar.barStyle = UIBarStyle.black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = UIBarStyle.default
    }
    
    func setupUI() {
        let viewI = UIView(frame: CGRect.zero)
        viewI.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        viewI.backgroundColor = UIColor.red
        viewI.tag = 101;
        print(viewI.center)
        print(viewI.frame.origin.x)
        print(viewI.frame.minX)
        print(viewI.frame.midX)
        print(viewI.frame.maxX)
        view.addSubview(viewI)
        
        let viewII = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        viewII.backgroundColor = UIColor.green
        viewI.addSubview(viewII)

//        bounds是基于自身坐标系的,
//        视图的bounds默认原点是(0,0),修改bounds的原点,只会影响子视图的位置,原视图不会发生变化
        viewI.bounds = CGRect(x: 10, y: 10, width: 100, height: 100)//结果 子视图向父视图的左上移动
        
//        通过bounds修改视图的width或height时,是以中心点为基准的,视图frame的原点也会随之改变
        let viewIII = UIView(frame: CGRect(x: 40, y: 40, width: 100, height: 100))
        viewIII.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
        print(viewIII.frame)//结果为 (30.0, 30.0, 120.0, 120.0)
        
        viewIII.backgroundColor = UIColor(red: 248, green: 248, blue: 248, alpha: 0.5)
        view.addSubview(viewIII)
        
        print(view.subviews)
        print(viewI.superview!)
        
        view.bringSubviewToFront(viewI)
        view.sendSubviewToBack(viewI)
        
        viewIII.removeFromSuperview()
        
        let viewIV = view.viewWithTag(101)
        print(viewIV!)
        
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            viewI.backgroundColor = UIColor(red: CGFloat(arc4random() % 256) / 255.0, green:CGFloat(arc4random() % 256) / 255.0, blue:CGFloat(arc4random() % 256) / 255.0, alpha:1.0)
        }
        
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
                print("push")
            })
            .disposed(by: disposeBag)
        
        

    }
}
