//
//  BubbleTabBarView.swift
//  AnimatedTabBar
//
//  Created by Alberto García-Muñoz on 21/04/2019.
//

import UIKit

class BubbleTabBarView: CommonUIView, AnimatedTabBarView {
    var delegate: AnimatedTabBarViewDelegate?
    var associatedController: UIViewController?
    var isSelected: Bool = false {
        didSet {
            UIView.animate(withDuration: AnimatedTabBarAppearance.shared.animationDuration) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.contentView.backgroundColor = strongSelf.isSelected ? strongSelf.model.backgroundColor : .clear
                strongSelf.label.isHidden = !strongSelf.isSelected
            }
        }
    }
    var position: Int = -1
    
    private var imageView = UIImageView()
    private var label = UILabel()
    private var contentView = UIView()
    
    private var widthConstraint: NSLayoutConstraint?
    
    private var model: BubbleTabBarItem! {
        didSet {
            setupLabel(with: model)
            setupImage()
            contentView.backgroundColor = model.backgroundColor
        }
    }
    
    func setupView(model: BubbleTabBarItem) {
        self.associatedController = model.controller
        self.model = model
    }
    
    private func setupLabel(with model: BubbleTabBarItem) {
        label.text = model.title
        label.font = AnimatedTabBarAppearance.shared.textFont
        label.textColor = model.tintColor
    }

    private func setupImage() {
        imageView.image = (isSelected ? model.selectedIcon : model.icon).imageWithInsets(insetDimen: 1)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configureContentView()
        configureImageView()
        configureLabel()
        isUserInteractionEnabled = true
        if newSuperview != nil {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(itemTapped(_:)))
            gestureRecognizer.numberOfTapsRequired = 1
            addGestureRecognizer(gestureRecognizer)
        } else {
            gestureRecognizers?.forEach(removeGestureRecognizer)
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let superview = superview else { return }
        heightAnchor.constraint(equalTo: superview.heightAnchor)
    }
    
    @objc private func itemTapped(_ sender: UITapGestureRecognizer) {
        delegate?.didTapped(on: self)
    }
    
    private func configureContentView() {
        contentView.backgroundColor = model.backgroundColor
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 0).isActive = true
        widthConstraint = contentView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95)
        widthConstraint?.isActive = true
        widthConstraint?.priority = .defaultLow
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8
    }
    
    private func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        let right = imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        right.priority = .defaultHigh
        right.isActive = true
    }
    
    private func configureLabel() {
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
    }
}
