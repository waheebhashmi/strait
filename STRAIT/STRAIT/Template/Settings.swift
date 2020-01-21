//
//  Settings.swift
//  STRAIT
//
//  Created by waheeb on 2020-01-15.
//  Copyright © 2020 Waheeb Hashmi . All rights reserved.
//

import SpriteKit

enum PhysicsCategories {
    static let none: UInt32 = 0
    static let ballCategory: UInt32 = 0x1

    static let switchCategory: UInt32 = 0x1 << 1
       static let switchCategory2: UInt32 = 0x1 << 1
       static let switchCategory3: UInt32 = 0x1 << 1
       static let switchCategory4: UInt32 = 0x1 << 1
    
       
}

//the order in which the objects appear
enum ZPositions {
    static let label: CGFloat = 0
    static let ball: CGFloat = 1
    static let bar: CGFloat = 2
}
