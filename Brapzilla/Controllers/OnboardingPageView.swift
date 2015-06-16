//
//  OnboardingPageView.swift
//  Brapzilla
//
//  Created by Pedro Peres on 4/29/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class OnboardingPageView: UIView {
    private var buttonContainerView: UIView!
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var signUpButton: UIButton!
    var loginButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View

    private func setupView() {
        setupImageView()
        setupDimmedView()
        setupButtons()
    }

    private func setupImageView() {
        imageView = UIImageView(frame: CGRectZero)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        self.addConstraintToBackground(imageView)
    }

    private func setupButtons() {
        buttonContainerView = UIView(frame: CGRectZero)
        buttonContainerView.backgroundColor = UIColor.blackColor()
        buttonContainerView.alpha = 0.0
        self.addSubview(buttonContainerView)
        self.addConstraintToButtonContainerView(buttonContainerView)
        self.setupLoginButton()
        self.setupSignupButton()
    }

    private func setupDimmedView(){
        let view = UIView()
        view.backgroundColor = UIColor.brapBlackColor()
        view.alpha = 0.4
        self.addSubview(view)
        self.addConstraintToBackground(view)
    }

    private func setupSignupButton() {
        signUpButton  = UIButton(frame: CGRectZero)
        signUpButton.backgroundColor = UIColor.brapLighterBlackColor()
        signUpButton.setTitle("Signup", forState: UIControlState.Normal)
        signUpButton.setTitleColor(UIColor.brapWhiteColor(), forState: UIControlState.Normal)
        signUpButton.titleLabel?.font = UIFont.brapBodyFont()
        buttonContainerView.addSubview(signUpButton)
        self.addConstraintToRightButton(signUpButton)
    }

    private func setupLoginButton() {
        loginButton  = UIButton(frame: CGRectZero)
        loginButton.backgroundColor = UIColor.brapBlueColor()
        loginButton.setTitle("Login", forState: UIControlState.Normal)
        loginButton.setTitleColor(UIColor.brapWhiteColor(), forState: UIControlState.Normal)
        loginButton.titleLabel?.font = UIFont.brapBodyFont()
        buttonContainerView.addSubview(loginButton)
        self.addConstraintToLeftButton(loginButton)
    }

    // MARK: - Actions

    func showButtons() {
        self.buttonContainerView.alpha = 1.0
    }

    func hideButtons() {
        self.buttonContainerView.alpha = 0.0
    }

    // MARK: - Constraints

    private func addConstraintToRightButton(view: UIView){
        view.setTranslatesAutoresizingMaskIntoConstraints(false)

        var constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Bottom,
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
    }

    private func addConstraintToLeftButton(view: UIView){
        view.setTranslatesAutoresizingMaskIntoConstraints(false)

        var constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Bottom,
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
    }

    private func addConstraintToButtonContainerView(view: UIView){
        view.setTranslatesAutoresizingMaskIntoConstraints(false)

        var constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 50)

        view.addConstraint(constraint)
    }

    private func addConstraintToBackground(view: UIView){
        view.setTranslatesAutoresizingMaskIntoConstraints(false)

        var constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0)

        view.superview!.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Right,
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
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        view.superview!.addConstraint(constraint)
    }
}
