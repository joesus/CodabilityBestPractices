//
//  DogTests.swift
//  CodabilityBestPracticesTests
//
//  Created by Joe Susnick on 3/3/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

@testable import CodabilityBestPractices
import XCTest

class DogTests: XCTestCase {

    let data = "sample-data".data(using: .utf8)!

    func testProperties() {
        let dog = Dog(
            name: "Fido",
            age: 3,
            image: data
        )
        XCTAssertEqual(dog.name, "Fido")
        XCTAssertEqual(dog.age, 3)
        XCTAssertEqual(dog.image, data)
    }
}
