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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
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
        
        addSubview(workingView)
        
        
    }
}

