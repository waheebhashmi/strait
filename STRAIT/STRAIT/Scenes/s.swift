//
//  s.swift
//  STRAIT
//
//  Created by waheeb on 2020-01-15.
//  Copyright © 2020 Waheeb Hashmi . All rights reserved.
//

import SpriteKit

class s: SKScene {
    for family in UIFont.familyNames.sorted() {
        let names = UIFont.fontNames(forFamilyName: family)
        print("Family: \(family) Font names: \(names)")
    }
}

