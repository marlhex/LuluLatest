//
//  GarmentTests.swift
//  LululemonTests
//
//  Created by Ignacio Arias on 2024-07-14.
//

// GarmentTests.swift

import XCTest
import SwiftData
@testable import Lululemon

class GarmentTests: XCTestCase {
    var container: ModelContainer!
    var context: ModelContext!

    override func setUpWithError() throws {
        container = try ModelContainer(for: Garment.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        context = ModelContext(container)
    }

    override func tearDownWithError() throws {
        container = nil
        context = nil
    }

    func testEmptyDatabase() throws {
        let fetchDescriptor = FetchDescriptor<Garment>()
        let count = try context.fetchCount(fetchDescriptor)
        XCTAssertEqual(count, 0, "Database should be empty initially")
    }

    func testAddGarments() throws {
        for i in 1...15 {
            let garment = Garment(name: "Garment \(i)")
            context.insert(garment)
        }

        try context.save()

        let fetchDescriptor = FetchDescriptor<Garment>()
        let count = try context.fetchCount(fetchDescriptor)
        XCTAssertEqual(count, 15, "Database should have 15 garments")
    }

    func testDeleteAllGarments() throws {
        // First, add some garments
        for i in 1...5 {
            let garment = Garment(name: "Garment \(i)")
            context.insert(garment)
        }
        try context.save()

        // Now delete all garments
        let fetchDescriptor = FetchDescriptor<Garment>()
        let garments = try context.fetch(fetchDescriptor)
        for garment in garments {
            context.delete(garment)
        }
        try context.save()

        // Check if the database is empty
        let count = try context.fetchCount(fetchDescriptor)
        XCTAssertEqual(count, 0, "Database should be empty after deleting all garments")
    }

    func testGarmentLimit() throws {
        // Add 11 garments
        for i in 1...11 {
            let garment = Garment(name: "Garment \(i)")
            context.insert(garment)
        }
        try context.save()

        let fetchDescriptor = FetchDescriptor<Garment>()
        let count = try context.fetchCount(fetchDescriptor)
        XCTAssertEqual(count, 11, "Database should have 11 garments")

        // Check if we're over the limit
        XCTAssertTrue(count > 10, "Database has more than 10 elements")
    }
}
