//
//  OnboardingPageContentViewController.swift
//  Brapzilla
//
//  Created by Pedro Peres on 4/29/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

protocol OnboardingContentViewControllerDelegate: class {
    func logginButtonTapped()
    func signupButtonTapped()
}

class OnboardingContentViewController: UIViewController {
    var mainView: OnboardingPageView!
    weak var delegate: OnboardingContentViewControllerDelegate?
    var pageIndex: Int?
    var titleText: String!
    var imageName: String!

    init(index: Int, delegate: OnboardingContentViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.pageIndex = index
        self.delegate = delegate
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView = OnboardingPageView(frame: self.view.bounds)
        self.view.addSubview(self.mainView)

        switch pageIndex! {
        case 0:
            self.mainView.imageView.image = UIImage(named: "more_girls_riding")
            self.mainView.hideButtons()

        case 1:
            self.mainView.imageView.image = UIImage(named: "guys_waiting")
            self.mainView.hideButtons()

        case 2:
            self.mainView.imageView.image = UIImage(named: "guys_riding")
            self.mainView.hideButtons()

        case 3:
            self.mainView.imageView.image = UIImage(named: "girls_riders")
            self.mainView.showButtons()
            self.mainView.loginButton.addTarget(self, action: Selector("logginButtonTapped"), forControlEvents: UIControlEvents.TouchUpInside)
            self.mainView.signUpButton.addTarget(self, action: Selector("signupButtonTapped"), forControlEvents: UIControlEvents.TouchUpInside)

        default:
            self.mainView.hideButtons()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func logginButtonTapped() {
        self.delegate?.logginButtonTapped()
    }

    func signupButtonTapped() {
        self.delegate?.signupButtonTapped()
    }
}
