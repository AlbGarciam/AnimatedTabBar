//
//  LabelAndDot.swift
//  TabBarTest
//
//  Created by Alberto García-Muñoz on 23/12/2018.
//  Copyright © 2018 Alberto García-Muñoz. All rights reserved.
//

import UIKit

class LabelAndDot: CommonUIView {

    var dot: UIView!
    var label: UILabel!
    var text: String = ""
    
    var isSelected : Bool = false {
        didSet {
            let selected = isSelected
            UIView.animate(withDuration: AnimatedTabBarAppearance.shared.animationDuration
                , delay: 0, usingSpringWithDamping: 0.45, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    self?.widthConstraint.constant = selected ? 4 : 0
                    self?.heightConstraint.constant = selected ? 4 : 0
                    self?.layoutIfNeeded()
                }, completion: nil)
        }
    }

    private var widthConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!
    
    override func commonInit() {
        super.commonInit()
        dot = UIView()
        label = UILabel()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        if newSuperview == nil { return }
        configureLabel()
        configureDot()
    }
    
    private func configureDot() {
        dot.backgroundColor = AnimatedTabBarAppearance.shared.dotColor
        dot.layer.cornerRadius = 2
        
        dot.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dot)
        
        widthConstraint = NSLayoutConstraint(item: dot!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 4)
        heightConstraint = NSLayoutConstraint(item: dot!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 4)
        addConstraints([widthConstraint, heightConstraint])
        dot.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dot.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    private func configureLabel() {
        label.text = text
        label.font = AnimatedTabBarAppearance.shared.textFont
        label.textColor = AnimatedTabBarAppearance.shared.textColor
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
