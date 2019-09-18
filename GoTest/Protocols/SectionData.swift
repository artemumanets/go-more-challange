//
//  SectionData.swift
//  GoTest
//
//  Created by Artem Umanets on 21/08/2019.
//  Copyright © 2019 GoMore. All rights reserved.
//

import Foundation
import UIKit

protocol SectionData {
    var title: String { get set }
    var count: Int { get }
    func cell(from tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell
}
