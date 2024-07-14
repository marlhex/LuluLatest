//
//  LululemonTests.swift
//  LululemonTests
//
//  Created by Ignacio Arias on 2024-04-15.
//

import XCTest
import SwiftUI
import SwiftData
@testable import Lululemon

class ContentViewTests: XCTestCase {
    func testContentViewInitialization() {
        let contentView = ContentView()
        XCTAssertNotNil(contentView)
    }
}

class AddGarmentViewTests: XCTestCase {
    func testAddGarmentViewInitialization() {
        let isPresented = Binding<Bool>.constant(true)
        let addGarmentView = AddGarmentView(isPresented: isPresented, garmentCount: 1)
        XCTAssertNotNil(addGarmentView)
    }
}
