//
//  TextField+Animation.swift
//  UIKitApp
//
//  Created by 1017143 on 01/11/22.
//

import UIKit

class CustomTextField: UITextField {
    
    func addShake(angle: Double = 0.04) {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [-angle, angle]
        animation.autoreverses = true
        animation.duration = randomInterval(0.12, variance: 0.025)
        animation.repeatCount = 1.5
        self.layer.add(animation, forKey: "animation")
        
        let animationTwo = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animationTwo.values = [4.0, 0.0]
        animationTwo.autoreverses = true
        animationTwo.duration = randomInterval(0.12, variance: 0.025)
        animationTwo.repeatCount = 1.5
        self.layer.add(animationTwo, forKey: "animationTwo")
    }
    
    func randomInterval(_ interval: TimeInterval, variance: Double) -> TimeInterval {
        return interval + variance * Double((Double(arc4random_uniform(1000)) - 500.0) / 500.0)
    }
    
    func removeShake() {
        self.layer.removeAllAnimations()
    }
}
