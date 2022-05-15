//
//  ViewController.swift
//  ExPulse
//
//  Created by 김종권 on 2022/05/15.
//

import UIKit

class ViewController: UIViewController {
  private let sampleView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.layer.cornerRadius = 50
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.sampleView)
    NSLayoutConstraint.activate([
      self.sampleView.heightAnchor.constraint(equalToConstant: 100),
      self.sampleView.widthAnchor.constraint(equalToConstant: 100),
      self.sampleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.sampleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    
    let scaleAnimaton = CABasicAnimation(keyPath: "transform.scale.xy")
    scaleAnimaton.fromValue = 1
    scaleAnimaton.toValue = 1.5
    
    let opacityAnimiation = CAKeyframeAnimation(keyPath: "opacity")
    opacityAnimiation.values = [0.3, 0.7, 0]
    opacityAnimiation.keyTimes = [0, 0.3, 1]
    
    let animationGroup = CAAnimationGroup()
    animationGroup.duration = 1.5
    animationGroup.repeatCount = .infinity
    animationGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
    animationGroup.animations = [scaleAnimaton, opacityAnimiation]

    DispatchQueue.main.async {
      self.sampleView.layer.add(animationGroup, forKey: "pulse")
    }
  }
}
