//
//  AnimatedTabBarView.swift
//  TabBarTest
//
//  Created by Alberto García-Muñoz on 17/12/2018.
//  Copyright © 2018 Alberto García-Muñoz. All rights reserved.
//

import UIKit

protocol AnimatedTabBarViewDelegate: AnyObject {
    func didTapped(on item: AnimatedTabBarView)
}

class AnimatedTabBarView: CommonUIView {

    private var contentView: UIView!
    private var imageView: UIImageView!
    private var labelAndDot : LabelAndDot!
    internal var position : Int = -1
    
    internal weak var delegate: AnimatedTabBarViewDelegate?
    internal var associatedController: UIViewController?
    
    private var topConstraint: NSLayoutConstraint!
    internal var isSelected : Bool! {
        didSet {
            let newValue = isSelected ?? false
            let imageHeight = -imageView.bounds.height
            labelAndDot.isSelected = isSelected
            UIView.animate(withDuration: AnimatedTabBarAppearance.shared.animationDuration
                , delay: 0, usingSpringWithDamping: 0.45, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                self?.imageView.alpha = newValue ? 0 : 1
                self?.labelAndDot.alpha = newValue ? 1 : 0
                self?.topConstraint.constant = newValue ? imageHeight : 0
                self?.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    override func commonInit() {
        super.commonInit()
        contentView = UIView()
        imageView = UIImageView()
        labelAndDot = LabelAndDot()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configureContentView()
        configureImageView()
        configureLabelAndDot()
        if newSuperview != nil {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AnimatedTabBarView.itemTapped(_:)))
            gestureRecognizer.numberOfTapsRequired = 1
            addGestureRecognizer(gestureRecognizer)
        } else {
            gestureRecognizers?.forEach(removeGestureRecognizer)
        }
        isUserInteractionEnabled = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topConstraint.constant = (isSelected ?? false) ? -imageView.bounds.height : 0
    }
    
    private func configureContentView() {
        contentView.backgroundColor = .clear
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
    }
    
    private func generateTopConstraint() {
        topConstraint = NSLayoutConstraint(item: imageView!,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0)
    }

    private func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        if topConstraint == nil {
            generateTopConstraint()
            addConstraint(topConstraint)
        }
    }
    
    private func configureLabelAndDot() {
        labelAndDot.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelAndDot)
        
        labelAndDot.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        labelAndDot.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        labelAndDot.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        labelAndDot.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    func setupView(model: AnimatedTabBarItem) {
        self.associatedController = model.controller
        labelAndDot.label.text = model.title
        imageView.image = model.icon.imageWithInsets(insetDimen: 4)
    }
    
    @objc private func itemTapped(_ sender: UITapGestureRecognizer) {
        delegate?.didTapped(on: self)
    }
}

extension UIImage {
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
    
}
