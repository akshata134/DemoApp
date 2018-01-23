//
//  constant.swift
//  DemoApp
//
//  Created by Rajesh on 20/01/18.
//  Copyright © 2018 medipod. All rights reserved.
//

import Foundation
import UIKit

let preferencesKeychain = UserDefaults.standard
extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
