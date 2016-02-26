//
//  MenuViewController.swift
//  ElasticTransitionDemo
//
//  Created by Stefan Peterson on 2/24/16.
//  Copyright © 2016 Stefan Peterson. All rights reserved.
//

import UIKit
import ElasticTransition

class MenuViewController: UIViewController {
    
    var transition: ElasticTransition!
    let rightGestureRecognizer = UIScreenEdgePanGestureRecognizer()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0x306890)
        
        // setup gesture recognizer
        rightGestureRecognizer.addTarget(self, action: "handleRightPan:")
        rightGestureRecognizer.edges = .Right
        view.addGestureRecognizer(rightGestureRecognizer)
    }
    
    // MARK: Elastic Transition Setup
    
    func handleRightPan(pan: UIPanGestureRecognizer) {
        if pan.state == .Began {
            transition.dissmissInteractiveTransition(self, gestureRecognizer: pan, completion: nil)
        } else {
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    // MARK: UI Setup
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
