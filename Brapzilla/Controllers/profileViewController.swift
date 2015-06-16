//
//  profileViewController.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/19/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
    }

    override func viewDidAppear(animated: Bool) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
