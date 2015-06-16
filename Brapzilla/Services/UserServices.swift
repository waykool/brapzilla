//
//  UserServices.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/14/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import Foundation
import Parse
import TwitterKit

private let _defaultUserService = UserServices()

class UserServices {

    class var sharedInstance: UserServices {
        return _defaultUserService
    }

    private var digitsAppearance: DGTAppearance {
        let appearance = DGTAppearance()
        appearance.backgroundColor = UIColor.brapLightBackgroundColor()
        appearance.accentColor = UIColor.brapBrandColor()
        return appearance
    }

    func logginUsingDigits(block: ((PFUser?, NSError?) -> Void)?) {
        let digits = Digits.sharedInstance()

        digits.authenticateWithDigitsAppearance(digitsAppearance, viewController: nil, title: "Login") { (session, error) in
            // Inspect session/error objects

            if let digitSession = session {
                let user = PFUser()
                user.username = session.phoneNumber
                user.password = session.authToken
                user["authTokenSecret"] = session.authTokenSecret
                digits.logOut()
                self.loginWithUser(user, block: block)
            }
        }
    }

    func signUpUsingDigits(block: ((PFUser?, NSError?) -> Void)?) {
        let digits = Digits.sharedInstance()
        digits.authenticateWithDigitsAppearance(digitsAppearance, viewController: nil, title: "Sign up") { (session, error) in
            // Inspect session/error objects

            if let digitSession = session {
                let user = PFUser()
                user.username = session.phoneNumber
                user.password = session.authToken
                user["authTokenSecret"] = session.authTokenSecret
                digits.logOut()
                self.tryToSignUpWithUser(user, block: block)
            }
        }
    }

    private func  loginWithUser(user: PFUser, block: ((PFUser?, NSError?) -> Void)?) {
        PFUser.logInWithUsernameInBackground(user.username!, password: user.password!, block: { (user, error) -> Void in
            if let blk = block {
                blk(user, error)
            }
        })
    }

    private func tryToSignUpWithUser(user: PFUser, block: ((PFUser?, NSError?) -> Void)?) {
        user.signUpInBackgroundWithBlock { (success, error) -> Void in
            switch (success, error) {
            case ( true, nil):
                if let blk = block {
                    blk(user, error)
                }

            default:
                self.loginWithUser(user, block: block)
            }
        }
    }
    
}
