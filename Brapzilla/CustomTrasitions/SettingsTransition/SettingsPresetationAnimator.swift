//
//  SettingsPresetationAnimator.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/18/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class SettingsPresetationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private var isPresenting: Bool!
    private struct Metrics {
        static let Translation: CGFloat = 250
    }

    init(isPresenting: Bool) {
        super.init()
        self.isPresenting = isPresenting
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.2
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        isPresenting == true ? animateTransitionPresentation(transitionContext) : animateTransitionDismissal(transitionContext)

    }

    func animateTransitionPresentation(transitionContext: UIViewControllerContextTransitioning) {
        let fromNavigationViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        let animationDuration = self .transitionDuration(transitionContext)

        containerView.backgroundColor = UIColor.brapDarkBackgroundColor()
        containerView.addSubview(toViewController.view)
        toViewController.view.addSubview(fromNavigationViewController!.view)

        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            fromNavigationViewController!.view.layer.transform = self.setupTransformation()
        }){ (finished) -> Void in
            fromNavigationViewController?.view.userInteractionEnabled = false
            transitionContext.completeTransition(finished)
        }
    }

    func animateTransitionDismissal(transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        let animationDuration = self .transitionDuration(transitionContext)
        UIApplication.sharedApplication().keyWindow!.insertSubview(toViewController.view, aboveSubview: containerView)

        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            toViewController.view.layer.transform = CATransform3DIdentity

            }, completion: { (finished) -> Void in
                toViewController.view.userInteractionEnabled = true
                transitionContext.completeTransition(finished)
        })
    }

    private func setupTransformation() -> CATransform3D {
        var t1 = CATransform3DIdentity;
        t1.m34 = 1.0 / -500;
        t1 = CATransform3DScale(t1, 0.6, 0.6, 1)
        t1 = CATransform3DTranslate(t1, Metrics.Translation, 40, 0)
        return t1
    }
}
