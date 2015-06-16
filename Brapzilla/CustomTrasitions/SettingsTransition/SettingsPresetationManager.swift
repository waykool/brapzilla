//
//  SettingsPresetationManager.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/18/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class SettingsPresetationManager: NSObject, UIViewControllerTransitioningDelegate {

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SettingsPresetationAnimator(isPresenting: true)
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SettingsPresetationAnimator(isPresenting: false)
    }

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        return SettingsPresentationController(presentedViewController: presented, presentingViewController: source)
    }
}
