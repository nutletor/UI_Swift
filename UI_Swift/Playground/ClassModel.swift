//
//  ClassModel.swift
//  UI_Swift
//
//  Created by PxLand on 2021/8/26.
//  Copyright © 2021 nutletor. All rights reserved.
//

import Foundation



class Cat {
    var name: String
    var gender: String
    init() {
        name = "cat"
        gender = "male"
    }
}

//一般来说，子类的初始化顺序是：
//
//1.设置子类自己需要初始化的参数，power = 10
//2.调用父类的相应的初始化方法，super.init()
//3.对父类中的需要改变的成员进行设定，name = "tiger"
class Tiger: Cat {
    let power: Int
    override init() {
        power = 10
//        super.init()
//        name = "tiger"
//        如果我们不需要打改变 name 的话，
//        虽然我们没有显式地对 super.init() 进行调用
//        不过由于这是初始化的最后了，Swift 也会自动替我们完成
    }
}

//单例
class MyManager  {
    static let sharedInstance = MyManager()
    private init() {}//覆盖默认的公开初始化方法，这让项目中的其他地方不能够通过 init 来生成自己的 MyManager 实例，也保证了类型单例的唯一性。
}

//class不能修饰类的存储属性，static可以修饰类的存储属性
class MyClass {
//    修饰计算属性
    class var age: Int {
        return 10
    }
//    修饰类方法
    class func classFunc() {
        
    }
    
    static func staticFunc() {
        
    }
}

//static修饰的类方法不能继承；class修饰的类方法可以继承
class SubClass: MyClass {
    override class func classFunc() {
//        super.classFunc()
    }
    
// error: Cannot override static method
//    override static func staticFunc() {
//
//    }
}
