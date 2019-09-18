//
//  UITableView+ReusableCell.swift
//  GoTest
//
//  Created by Artem Umanets on 21/08/2019.
//  Copyright © 2019 GoMore. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func reusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        // swiftlint:disable:next force_cast
        return self.dequeueReusableCell(withIdentifier: T.defaultIdentifier, for: indexPath) as! T
    }
}
