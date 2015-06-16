//
//  SettingsViewController.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/18/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewDelegate {
    var profilePresentationManager: ProfilePresetationManager = ProfilePresetationManager()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = SettingsView(frame: self.view.frame, delegate: self)
    }

    func closeSettings() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func showProfile() {
        let controller = profileViewController()
        controller.transitioningDelegate = profilePresentationManager
        self.presentViewController(controller, animated: true, completion: nil)
    }
}
