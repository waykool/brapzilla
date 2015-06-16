//
//  HeaderAvatarView.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/19/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class HeaderAvatarView: UIView {
    private var avatar: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupView() {
        setupAvatar()
    }

    private func setupAvatar() {
        avatar = UIImageView(frame: CGRectZero)
        avatar.layer.cornerRadius = 50
        avatar.clipsToBounds = true
        avatar.backgroundColor = UIColor.brapLighterBlackColor()
        avatar.contentMode = UIViewContentMode.Center
        avatar.layer.borderColor = UIColor.brapBrandColor().CGColor
        avatar.layer.borderWidth = 2
        avatar.image = UIImage(named: "DarkPhotoIcon")
        self.addSubview(avatar)
        self.addConstraintToAvatar(avatar)
    }

    // MARK: Constraint

    private func addConstraintToAvatar(view: UIView){
        view.setTranslatesAutoresizingMaskIntoConstraints(false)

        var constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 100)

        view.addConstraint(constraint)


        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 100)
        
        view.addConstraint(constraint)
    }
}
