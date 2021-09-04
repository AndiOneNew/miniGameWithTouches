//
//  MyCustomView.swift
//  MiniGamesCircleView
//
//  Created by Илья Новиков on 17.08.2021.
//

import UIKit

@IBDesignable class MyCustomView: UIView {

    var workingView: UIView!
    var xibName: String = "MyCustomView"
    var someTag: Int = -1
//    let upSize = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
//        checkIsHidden()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
//        checkIsHidden()
    }
    
    func getFromXib () -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    func setCustomView() {
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workingView.backgroundColor = .blue
        workingView.layer.cornerRadius = frame.size.width / 2
        someTag = workingView.tag
        
        addSubview(workingView)
    }
//    func checkIsHidden() {
//        if workingView.isHidden {
//            workingView = getFromXib()
//            workingView.frame.size.height += CGFloat(upSize)
//            workingView.frame.size.width += CGFloat(upSize)
//            workingView.frame = bounds
//            workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            workingView.backgroundColor = .systemIndigo
//            workingView.layer.cornerRadius = frame.size.width / 2
//
//            addSubview(workingView)
//        }
//    }
    func checkTag (_ tag: Int) -> Bool {
        if tag.self == tag {
            return true
        } else {
            return false
        }
    }
}

