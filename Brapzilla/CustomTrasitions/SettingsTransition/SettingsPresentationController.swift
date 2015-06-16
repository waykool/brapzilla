//
//  SettingsPresentationController.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/18/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class SettingsPresentationController: UIPresentationController {
    override init(presentedViewController: UIViewController!, presentingViewController: UIViewController!){
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }

    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSizeMake(parentSize.width, parentSize.height)
    }

    override func frameOfPresentedViewInContainerView() -> CGRect {
        var presentedViewFrame = CGRectZero
        let containerBonds = self.containerView.bounds
        presentedViewFrame.size = CGSizeMake(containerBonds.width, containerBonds.height)
        return presentedViewFrame
    }

    override func containerViewWillLayoutSubviews() {
        presentedViewController.view.frame = frameOfPresentedViewInContainerView()
    }
}
