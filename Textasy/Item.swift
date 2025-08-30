//
//  Item.swift
//  Textasy
//
//  Created by Christian Stenevi on 2025-08-30.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
