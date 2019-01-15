//
//  AnimatedTabBar.swift
//  TabBarTest
//
//  Created by Alberto García-Muñoz on 17/12/2018.
//  Copyright © 2018 Alberto García-Muñoz. All rights reserved.
//

import UIKit

public protocol AnimatedTabBarDelegate : AnyObject {
    var numberOfItems : Int { get }
    func tabBar(_ tabBar: AnimatedTabBar, itemFor index: Int) -> AnimatedTabBarItem
    func initialIndex(_ tabBar: AnimatedTabBar) -> Int?
}

internal protocol AnimatedTabBarInternalDelegate : AnyObject {
    func selected(_ tabbar: AnimatedTabBar, newItem: UIViewController?, oldItem: UIViewController?)
}

public struct AnimatedTabBarItem {
    public var icon: UIImage
    public var title: String
    public var controller: UIViewController
    
    public init(icon: UIImage, title: String, controller: UIViewController) {
        self.icon = icon
        self.title = title
        self.controller = controller
    }
}

open class AnimatedTabBar: CommonUIView {
    
    private var contentView : UIView!
    internal var stackView: UIStackView!
    open weak var delegate: AnimatedTabBarDelegate?
    internal weak var internalDelegate : AnimatedTabBarInternalDelegate?
    
    internal weak var containerView : UIView?
    private(set) var selected: AnimatedTabBarView? {
        didSet {
            internalDelegate?.selected(self,
                                       newItem: selected?.associatedController,
                                       oldItem: oldValue?.associatedController)
        }
    }
    
    override func commonInit() {
        super.commonInit()
        contentView = UIView()
        stackView = UIStackView()
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configureContentView()
        if delegate?.numberOfItems ?? 0 > 0 {
            configureStackView()
            fillStackView()
        }
    }
    
    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        selectItem(at: selected?.position ?? delegate?.initialIndex(self) ?? 0)
    }
    
    private func configureContentView() {
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.layer.masksToBounds = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: heightOfStackView).isActive = true
    }
    
    private func configureStackView() {
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func fillStackView() {
        for i in 0 ..< ( delegate?.numberOfItems ?? 0 ) {
            if let item = delegate?.tabBar(self, itemFor: i) {
                // Add View to the stack
                let view = AnimatedTabBarView()
                view.delegate = self
                stackView.addArrangedSubview(view)
                view.setupView(model: item)
                view.position = i
                view.isSelected = false
            }
        }
    }

    private func selectItem(at position: Int) {
        if position < stackView.arrangedSubviews.count && position >= 0 {
            selected?.isSelected = false
            selected = stackView.arrangedSubviews[position] as? AnimatedTabBarView
            selected?.isSelected = true
        }
    }
}

extension AnimatedTabBar : AnimatedTabBarViewDelegate {
    func didTapped(on item: AnimatedTabBarView) {
        if item.isSelected { // move to root
            if AnimatedTabBarAppearance.shared.popsToRoot,
                let nav = selected?.associatedController as? UINavigationController {
                nav.popToRootViewController(animated: true)
            }
        } else { // replace view
            selectItem(at: item.position)
        }
    }
}
