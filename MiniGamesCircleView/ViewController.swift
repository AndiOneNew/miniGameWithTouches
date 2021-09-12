//
//  ViewController.swift
//  MiniGamesCircleView
//
//  Created by Илья Новиков on 17.08.2021.
//
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
    var arrayCustomViews = [MyCustomView]()
    let upSize = 10 //Число для увеличения размеров по ширине и величине
    
    
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
        
//        Вызов функции сравнения границ фремов с передачей внутрь функции активной вью
        let viewInterSected = self.checkFrameView(gestureView)
        if viewInterSected {
            UIView.animate(withDuration: 1) {
                let someView = self.arrayCustomViews.filter{$0.tag == gestureView.tag }.first
                someView?.workingView.backgroundColor = .systemIndigo
                someView?.transform = (someView?.transform.scaledBy(x: 1.2, y: 1.2))!
            }
//            let someView = arrayCustomViews.filter { $0.tag == gestureView.tag }.first
//            someView?.workingView.backgroundColor = .systemIndigo
//            someView?.workingView.frame.size.height += CGFloat(upSize)
//            someView?.workingView.frame.size.width += CGFloat(upSize)
//            someView?.workingView.layer.cornerRadius = someView!.workingView.frame.size.width / 2
            removeViewFromArray()
        }
    }
    
//    Функция для сравнения фреймов вьюшек из массива и активной вьюшки
    func checkFrameView(_ view: UIView) -> Bool {
        for value in arrayCustomViews {
            if (!(view .isEqual(value))) {
                if(view.frame.intersects(value.frame)) {
                    value.isHidden = true
                    value.tag = 0
                    arrayCustomViews.append(value)
                    return true
                }
            }
        }
        return false
    }

    func removeViewFromArray() {
        arrayCustomViews.removeAll(where: {$0.tag == 0 })
    }
    
}

