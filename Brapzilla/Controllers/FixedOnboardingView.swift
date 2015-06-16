//
//  FixedOnboardingView.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/11/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class FixedOnboardingView: UIView {
    var pageControl: UIPageControl!


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        setupView()
        self.userInteractionEnabled = false
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View

    private func setupView() {
        self.setupPageControl()
        self.setupByCreatingAccountLabel()
        self.setupTermsAndConditionsLabel()
    }

    private func setupPageControl() {
        pageControl = UIPageControl(frame: CGRectMake(0, self.frame.height - 200, self.frame.width, 100))
        self.addSubview(pageControl)
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
    }

    private func setupByCreatingAccountLabel() {
        let creatingAccountLabel = UILabel(frame: CGRectMake(0, self.frame.height - 140, self.frame.width, 50))
        creatingAccountLabel.numberOfLines = 2
        creatingAccountLabel.text = "By creating an account you agree to our \n      and"
        creatingAccountLabel.textAlignment = NSTextAlignment.Center
        creatingAccountLabel.textColor = UIColor.brapWhiteColor()
        creatingAccountLabel.font = UIFont.brapCaptionFont()
        self.addSubview(creatingAccountLabel)
    }

    private func setupTermsAndConditionsLabel() {
        let creatingAccountLabel = UILabel(frame: CGRectMake(0, self.frame.height - 132, self.frame.width, 50))
        creatingAccountLabel.numberOfLines = 2
        creatingAccountLabel.text = "Terms of Sercices        Privacy Policy"
        creatingAccountLabel.textAlignment = NSTextAlignment.Center
        creatingAccountLabel.textColor = UIColor.brapOrangeColor()
        creatingAccountLabel.font = UIFont.brapCaptionFont()
        self.addSubview(creatingAccountLabel)
    }
}
