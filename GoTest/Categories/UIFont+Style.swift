//
//  UIFont+PreferredFontStyle.swift
//  GoTest
//
//  Created by Artem Umanets on 21/08/2019.
//  Copyright © 2019 GoMore. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    private func font(withTraits traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(traits)!, size: 0)
    }

    var regular: UIFont {
        return self.font(withTraits: UIFontDescriptor.SymbolicTraits(rawValue: 0))
    }

    var bold: UIFont {
        return self.font(withTraits: .traitBold)
    }
}
