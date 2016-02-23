//
//  ViewController.swift
//  CircleMenuDemo
//
//  Created by Stefan Peterson on 2/22/16.
//  Copyright © 2016 Stefan Peterson. All rights reserved.
//

import UIKit
import CircleMenu

extension UIColor {
    convenience init(rgb: UInt) {
        self.init (
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}



class ViewController: UIViewController {

    
    let items: [(icon:String, color: UIColor)] = [
        ("icon1", UIColor(rgb:0xdd4b39)),
        ("icon2", UIColor(rgb:0x007bb5)),
        ("icon3", UIColor(rgb:0x55acee)),
        ("icon4", UIColor(rgb:0x3b5998)),
        ("icon5", UIColor(rgb:0xfb3958)),
        ("mainIcon", UIColor.clearColor()),
        ("mainIconSelected", UIColor.whiteColor())
    ]
    
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(rgb:0x0f1427)
        
        let button = CircleMenu(
            frame: CGRect(x: 175, y: 215, width: 50, height: 50),
            normalIcon: "mainIcon",
            selectedIcon: "mainIconSelected",
            buttonsCount: 5,
            duration: 1,
            distance: 150)
        button.delegate = self
        button.layer.cornerRadius = button.frame.size.width / 2.0
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: CircleMenu Delegates

    func circleMenu(circleMenu: CircleMenu, willDisplay button: CircleMenuButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        button.setImage(UIImage(imageLiteral: items[atIndex].icon), forState: .Normal)
        
        let highlightedImage = UIImage(imageLiteral: items[atIndex].icon).imageWithRenderingMode(.AlwaysTemplate)
        button.setImage(highlightedImage, forState: .Highlighted)
        button.tintColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.3)
    }

    func circleMenu(circleMenu: CircleMenu, buttonWillSelected button: CircleMenuButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(circleMenu: CircleMenu, buttonDidSelected button: CircleMenuButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
    }

}

