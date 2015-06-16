//
//  AppFlow.swift
//  Brapzilla
//
//  Created by Pedro Peres on 4/29/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit
import Parse
import TwitterKit

private let _defaultFlow = AppFlow()

class AppFlow {
    var appDelegate : AppDelegate

    class var defaultFlow: AppFlow {
        return _defaultFlow
    }

    init() {
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    }

    func start() {
        showBoarding()
    }

    func showBoarding() {
        var currentUser = PFUser.currentUser()
        if (currentUser != nil) {
            if let window = appDelegate.window {
                let viewController = RideListViewController()
                let navController = UINavigationController(rootViewController: viewController)
                window.rootViewController = navController
            }
        } else {
            if let window = appDelegate.window {
                let viewController = OnboardingViewController()
                window.rootViewController = viewController
            }
        }
    }

    func showRideListForControllerAfterOnboarding(controller: UIViewController) {
        let newController = RideListViewController()
       // controller.presentViewController(newController, animated: <#Bool#>, completion: <#(() -> Void)?##() -> Void#>)
    }

}
