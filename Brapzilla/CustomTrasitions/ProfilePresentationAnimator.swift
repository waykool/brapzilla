//
//  ProfilePresentationAnimator.swift
//  Brapzilla
//
//  Created by Pedro Peres on 6/4/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class ProfilePresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private var isPresenting: Bool!

    init(isPresenting: Bool) {
        super.init()
        self.isPresenting = isPresenting
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 2.5
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        isPresenting == true ? animateTransitionPresentation(transitionContext) : animateTransitionDismissal(transitionContext)
    }

    func animateTransitionPresentation(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! SettingsViewController
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        let animationDuration = self .transitionDuration(transitionContext)

        let fromView = fromViewController.view as! SettingsView
        let fakeAvatar = fromView.avatar.snapshotViewAfterScreenUpdates(true)
        fromView.avatar.hidden = true
        let fakeFromView = fromView.snapshotViewAfterScreenUpdates(true)
        fakeAvatar.frame = fromView.avatar.frame
        fakeFromView.frame = fromView.frame

        containerView.addSubview(fakeFromView)
        fromView.hidden = true
        containerView.addSubview(fakeAvatar)
        containerView.addSubview(toViewController.view)


        toViewController.view.frame = CGRectInset(fakeFromView.frame, -fakeFromView.frame.width, 0)
        UIView.animateWithDuration(5, animations: { () -> Void in
            fakeFromView.frame = CGRectInset(fakeFromView.frame, -fakeFromView.frame.width, 0)
            toViewController.view.frame = CGRectInset(toViewController.view.frame, -fakeFromView.frame.width, 0)


            }){ (finished) -> Void in
                transitionContext.completeTransition(finished)
        }

    }

    func animateTransitionDismissal(transitionContext: UIViewControllerContextTransitioning) {
        
    }

}
