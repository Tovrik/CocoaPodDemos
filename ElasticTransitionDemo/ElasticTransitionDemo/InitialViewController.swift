//
//  ViewController.swift
//  ElasticTransitionDemo
//
//  Created by Stefan Peterson on 2/23/16.
//  Copyright © 2016 Stefan Peterson. All rights reserved.
//

import UIKit
import ElasticTransition

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

class InitialViewController: UIViewController {

    var transition = ElasticTransition()
    let leftGestureRecognizer = UIScreenEdgePanGestureRecognizer()
    let rightGestureRecognizer = UIScreenEdgePanGestureRecognizer()
    
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0xe16d41)
        // setup the elastic transition
        transition.sticky = true
        transition.showShadow = true
        transition.radiusFactor = 0.4
        transition.panThreshold = 0.4
        transition.transformType = .TranslateMid
        
        //setup gesture recognizers
        leftGestureRecognizer.addTarget(self, action: "handleLeftPan:")
        leftGestureRecognizer.edges = .Left
        view.addGestureRecognizer(leftGestureRecognizer)
        rightGestureRecognizer.addTarget(self, action: "handleRightPan:")
        rightGestureRecognizer.edges = .Right
        view.addGestureRecognizer(rightGestureRecognizer)
    }

    // MARK: Elastic Transition Setup
    
    func handleLeftPan(pan: UIPanGestureRecognizer) {
        if pan.state == .Began {
            transition.edge = .Left
            transition.startInteractiveTransition(self, segueIdentifier: "menu", gestureRecognizer: pan)
        } else {
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    func handleRightPan(pan: UIPanGestureRecognizer) {
        if pan.state == .Began {
            transition.edge = .Right
            transition.startInteractiveTransition(self, segueIdentifier: "settings", gestureRecognizer: pan)
        } else {
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    // MARK: Segue Setup
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController
        vc.transitioningDelegate = transition
        vc.modalPresentationStyle = .Custom
        if segue.identifier == "menu" {
            if let vc = vc as? MenuViewController {
                vc.transition = transition
            }
        } else {
            if let vc = vc as? SettingsViewController {
                vc.transition = transition
            }
        }
    }
    
    // MARK: UI Setup

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

