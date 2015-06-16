//
//  OnboardingViewController.swift
//  Brapzilla
//
//  Created by Pedro Peres on 4/29/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit
import TwitterKit
import Parse

class OnboardingViewController: UIViewController, OnboardingContentViewControllerDelegate, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var mainView: FixedOnboardingView!
    var childControllers: [UIViewController]!
    var pageViewController : UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.automaticallyAdjustsScrollViewInsets = false
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.setupPageViewController()
        self.mainView = FixedOnboardingView(frame: self.view.frame)
        self.view.addSubview(mainView)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }

    // MARK: - Setup

    func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        pageViewController.view.frame = self.view.frame
        self.view.addSubview(pageViewController.view)

        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([OnboardingContentViewController(index: 0, delegate: self)], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        self.addChildViewController(pageViewController)
    }

    // MARK: - Action

    let digitsAppearance = DGTAppearance()
    func logginButtonTapped() {
        UserServices.sharedInstance.logginUsingDigits(nil)
    }

    func signupButtonTapped() {
        UserServices.sharedInstance.signUpUsingDigits(nil)
    }

    // MARK: - PageViewController DataSouce

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as! OnboardingContentViewController).pageIndex ?? 0)!
        if(index == 0){
            return nil
        }

        let newIndex = index - 1
        return self.viewControllerAtIndex(newIndex)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as! OnboardingContentViewController).pageIndex ?? 0)!

        if(index == 3){
            return nil
        }

        let newIndex = index + 1
        return self.viewControllerAtIndex(newIndex)
    }

    // MARK: - PageViewController Delegate

    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool) {

        if(completed.boolValue){
            let controller = pageViewController.viewControllers.first as! OnboardingContentViewController
            mainView.pageControl.currentPage = controller.pageIndex!
        }
    }

    // MARK: - Service Methods

    func viewControllerAtIndex(index: Int) -> UIViewController {
        return OnboardingContentViewController(index: index, delegate: self)
    }
}
