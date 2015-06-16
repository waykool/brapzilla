//
//  ProfilePresenationManager.swift
//  Brapzilla
//
//  Created by Pedro Peres on 6/4/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class ProfilePresetationManager: NSObject, UIViewControllerTransitioningDelegate {

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
         return ProfilePresentationAnimator(isPresenting: true)
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ProfilePresentationAnimator(isPresenting:false)
    }

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        return ProfilePresentationController(presentedViewController: presented, presentingViewController: source)
    }

}
