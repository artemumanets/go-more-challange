//
//  String+Utils.swift
//  GoTest
//
//  Created by Artem Umanets on 21/08/2019.
//  Copyright © 2019 GoMore. All rights reserved.
//

import Foundation

extension String {

    var firstLetter: String {
        return String(self.first ?? Character(""))
    }
}
