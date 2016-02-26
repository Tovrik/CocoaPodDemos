//
//  SettingsViewController.swift
//  ElasticTransitionDemo
//
//  Created by Stefan Peterson on 2/24/16.
//  Copyright © 2016 Stefan Peterson. All rights reserved.
//

import UIKit
import ElasticTransition

class SettingsViewController: UIViewController {

    var transition: ElasticTransition!
    let leftGestureRecognizer = UIScreenEdgePanGestureRecognizer()
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0x2d9b69)

        //setup gesture recognizers
        leftGestureRecognizer.addTarget(self, action: "handleLeftPan:")
        leftGestureRecognizer.edges = .Left
        view.addGestureRecognizer(leftGestureRecognizer)
            }

    // MARK: Elastic Transition Setup
    
    func handleLeftPan(pan: UIPanGestureRecognizer) {
        if pan.state == .Began{
            transition.dissmissInteractiveTransition(self, gestureRecognizer: pan, completion: nil)
        }else{
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    // MARK: UI Setup
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
