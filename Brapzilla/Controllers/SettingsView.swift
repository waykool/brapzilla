//
//  SettingsView.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/18/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

protocol SettingsViewDelegate: class {
    func closeSettings()
    func showProfile()
}

class SettingsView: UIView {
    private let headerViewHeight: CGFloat = 150
    private let padding: CGFloat = 10
    private var headerContainerView: UIView!
    var avatar: HeaderAvatarView!
    private var delegate: SettingsViewDelegate
    var tableView: UITableView!

    init(frame: CGRect, delegate: SettingsViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        self.setupView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupView() {
        setupHeader()
        setupTableView()
        setupCloseButton()
    }

    private func setupHeader() {
        headerContainerView = UIView(frame: CGRectMake(0, 0, self.frame.width, headerViewHeight))
        headerContainerView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleBottomMargin
        headerContainerView.clipsToBounds = true
        self.addSubview(headerContainerView)
        setupDarkTopBar(headerContainerView)
        setupLogoutView(headerContainerView)
        setupProfileView(headerContainerView)
        setupAvatar(headerContainerView)
    }

    private func setupDarkTopBar(containerView: UIView) {
        let backgroundView = UIView(frame: CGRectMake(0, 0, containerView.frame.width, 84))
        backgroundView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleBottomMargin
        backgroundView.backgroundColor = UIColor.blackColor()
        backgroundView.alpha = 0.1
        containerView.addSubview(backgroundView)

        let bottomLine = UIView(frame: CGRectMake(0, backgroundView.frame.height - 1, backgroundView.frame.width, 1))
        bottomLine.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        bottomLine.backgroundColor = UIColor.brapBrandColor()
        containerView.addSubview(bottomLine)
    }
    
    private func setupAvatar(containerView: UIView) {
        avatar = HeaderAvatarView(frame: self.frame)
        containerView.addSubview(avatar)
        self.addConstraintToAvatar(avatar)
    }

    private func setupLogoutView(containerView: UIView) {
        var logoutContainerView = UIView(frame: CGRectMake(10, 50, 100, 32))
        containerView.addSubview(logoutContainerView)

        let logo = UIImageView(frame: CGRectMake(0, 0, 22, 22))
        logo.alpha = 0.5
        logo.contentMode = UIViewContentMode.ScaleAspectFit
        logo.image = UIImage(named: "ExitIcon")
        logoutContainerView.addSubview(logo)

        let label = UILabel(frame: CGRectMake(27, 0, 70, 22))
        label.textColor = UIColor.brapWhiteTextColor()
        label.text = "SIGN OUT"
        label.font = UIFont.brapCaptionFont()
        logoutContainerView.addSubview(label)

        let tapRec = UITapGestureRecognizer(target: self, action: Selector("signOutButtonTapped"))
        logoutContainerView.addGestureRecognizer(tapRec)
    }

    private func setupProfileView(containerView: UIView) {
        let xCoor = containerView.frame.width - 100
        var profileContainerView = UIView(frame: CGRectMake(xCoor, 50, 90, 32))
        profileContainerView.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
        containerView.addSubview(profileContainerView)

        let logo = UIImageView(frame: CGRectMake(68, 0, 22, 22))
        logo.alpha = 0.5
        logo.contentMode = UIViewContentMode.ScaleAspectFit
        logo.image = UIImage(named: "ProfileIcon")
        profileContainerView.addSubview(logo)

        let label = UILabel(frame: CGRectMake(0, 0, 63, 22))
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.brapWhiteTextColor()
        label.text = "PROFILE"
        label.font = UIFont.brapCaptionFont()
        profileContainerView.addSubview(label)

        let tapRec = UITapGestureRecognizer(target: self, action: Selector("profileButtonTapped"))
        profileContainerView.addGestureRecognizer(tapRec)
    }

    private func setupTableView() {
        tableView = UITableView(frame: CGRectZero)
        tableView.backgroundColor = UIColor.clearColor()
        self.addSubview(tableView)
        self.addConstraintToTableView(tableView)
    }

    private func setupCloseButton() {
        let containerView = UIView(frame: CGRectZero)
        let closeButton = UIImageView(frame: CGRectZero)
        closeButton.image = UIImage(named: "CloseIcon")
        closeButton.layer.cornerRadius = 30
        closeButton.layer.borderColor = UIColor.brapWhiteColor().CGColor
        closeButton.layer.borderWidth = 2
        closeButton.contentMode = UIViewContentMode.Center
        closeButton.clipsToBounds = true
        closeButton.alpha = 0.5
        closeButton.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        containerView.addSubview(closeButton)
        self.addSubview(containerView)
        self.addConstraintToCloseButton(containerView)

        let tapRec = UITapGestureRecognizer()
        tapRec.addTarget(self, action: Selector("closeButtonTapped"))
        tapRec.numberOfTapsRequired = 1
        containerView.addGestureRecognizer(tapRec)
    }

    // MARK: Action

    func signOutButtonTapped() {
        println("log out!")

    }

    func profileButtonTapped() {
        self.delegate.showProfile()
    }

    func closeButtonTapped() {
        self.delegate.closeSettings()
    }

    // MARK: Constraint

    private func addConstraintToCloseButton(view: UIView){
        view.setTranslatesAutoresizingMaskIntoConstraints(false)

        var constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 60)

        view.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 60)

        view.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -40)

        view.superview!.addConstraint(constraint)


        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)
    }


    private func addConstraintToTableView(view: UIView){
        view.setTranslatesAutoresizingMaskIntoConstraints(false)

        var constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: headerViewHeight + padding)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -150)

        view.superview!.addConstraint(constraint)


        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)
        
        view.superview!.addConstraint(constraint)
    }

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
            constant: 50)

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
