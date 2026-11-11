//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDAssets provides a set of default images, that can be supplied to the PKHUD's content views.
open class PKHUDAssets: NSObject {

    open class var crossImage: UIImage { return PKHUDAssets.bundledImage(named: "cross") }
    open class var checkmarkImage: UIImage { return PKHUDAssets.bundledImage(named: "checkmark") }
    open class var progressActivityImage: UIImage { return PKHUDAssets.bundledImage(named: "progress_activity") }
    open class var progressCircularImage: UIImage { return PKHUDAssets.bundledImage(named: "progress_circular") }

    internal class func bundledImage(named name: String) -> UIImage {
        #if SWIFT_PACKAGE
        // Swift Package Manager puts the asset catalog in the package's own resource bundle.
        let bundle = Bundle.module
        #else
        // The framework target in PKHUD.xcodeproj, which only the demo app uses, keeps it in the framework.
        let bundle = Bundle(for: PKHUDAssets.self)
        #endif
        return UIImage(named: name, in: bundle, compatibleWith: nil) ?? UIImage()
    }
}
