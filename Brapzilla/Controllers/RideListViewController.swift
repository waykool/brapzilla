//
//  RideListViewController.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/12/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class RideListViewController: UIViewController {
    var settingsPresentationManager: SettingsPresetationManager = SettingsPresetationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        self.view.backgroundColor = UIColor.brapLightBackgroundColor()
    }

    // MARK: - Setup

    func setupNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Brapzilla"
        let menuButton = UIBarButtonItem(image: UIImage(named: "MenuIcon"), style: UIBarButtonItemStyle.Plain, target: self, action: Selector("menuTappedAction"))
        let plusButton = UIBarButtonItem(image: UIImage(named: "PlusIcon"), style: UIBarButtonItemStyle.Plain, target: self, action: Selector("plusTappedAction"))

        self.navigationItem.setLeftBarButtonItem(menuButton, animated: false)
        self.navigationItem.setRightBarButtonItem(plusButton, animated: false)
    }

    // MARK: - Action

    func menuTappedAction() {
        let controller = SettingsViewController()
        controller.transitioningDelegate = settingsPresentationManager
        self.presentViewController(controller, animated: true, completion: nil)
    }

    func plusTappedAction() {

    }
}
