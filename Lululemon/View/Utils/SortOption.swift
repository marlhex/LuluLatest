//
//  SortOption.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//

import Foundation

enum SortOption: String, Identifiable, CaseIterable {
    case alpha, creationTime

    var id: Self {
        self
    }
}
