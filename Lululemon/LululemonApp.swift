//
//  LululemonApp.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//

import SwiftUI
import SwiftData

@main
struct LululemonApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Garment.self])
    }
}
