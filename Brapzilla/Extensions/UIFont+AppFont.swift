//
//  UIFont+AppFont.swift
//  Brapzilla
//
//  Created by Pedro Peres on 5/4/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

import UIKit

extension UIFont {

    //preferred font for text styles:
    // UIFontTextStyleHeadline
    // UIFontTextStyleSubheadline
    // UIFontTextStyleBody
    // UIFontTextStyleFootnote
    // UIFontTextStyleCaption1
    // UIFontTextStyleCaption2

    class func brapHeadLineFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    }

    class func brapSubheadlineFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }

    class func brapBodyFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }

    class func brapFootnoteFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
    }

    class func brapCaptionFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
    }
}