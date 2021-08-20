//
//  ViewController.swift
//  MiniGamesCircleView
//
//  Created by Илья Новиков on 17.08.2021.
//
import Foundation
import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var customViewTag1: MyCustomView!
    @IBOutlet weak var customViewTag2: MyCustomView!
    @IBOutlet weak var customViewTag3: MyCustomView!
    @IBOutlet weak var customViewTag4: MyCustomView!
    @IBOutlet weak var customViewTag5: MyCustomView!
    @IBOutlet weak var customViewTag6: MyCustomView!
    @IBOutlet weak var customViewTag7: MyCustomView!
    @IBOutlet weak var customViewTag8: MyCustomView!
    @IBOutlet weak var customViewTag9: MyCustomView!
    var arrayCustomViews =  [MyCustomView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCustomViews = [customViewTag1, customViewTag2,customViewTag3,customViewTag4,customViewTag5,customViewTag6,customViewTag7, customViewTag8,customViewTag9]
        
    }
    
    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint (x: gestureView.center.x + gestureTranslation.x , y: gestureView.center.y + gestureTranslation.y)
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        levelUpForCustomView(gestureView)
    }
    
    func levelUpForCustomView(_ vc: UIView) {
        for value in arrayCustomViews {
            if vc.tag != value.tag {
                var r1 = (vc.frame.width) / 2
                var r2 = value.frame.width / 2
                var dist = pow(pow((vc.center.x - value.center.x), 2) + pow((vc.center.y - value.center.y), 2), 0.5)
                if r1 + r2 >= dist {
                    value.isHidden = true
                    }
            }  
        }
    }
}

