//
//  Garment.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//

import Foundation
import SwiftData

@Model
final class Garment: Identifiable {
    let id = UUID()
    var name: String
    var creationTime: Date = Date()

    init(name: String, creationTime: Date = Date()) {
        self.name = name
        self.creationTime = creationTime
    }
}
