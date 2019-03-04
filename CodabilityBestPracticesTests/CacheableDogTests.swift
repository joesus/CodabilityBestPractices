//
//  CacheableDogTests.swift
//  CodabilityBestPracticesTests
//
//  Created by Joe Susnick on 3/3/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

@testable import CodabilityBestPractices
import XCTest

class CacheableDogTests: XCTestCase {

    let imageData = "sample-image".data(using: .utf8)!

    lazy var dog: Dog = {
        return Dog(name: "Fido", age: 3, image: imageData)
    }()

    lazy var cacheableDog: CacheableDog = {
        return CacheableDog(name: "Fido", age: 3, imageData: imageData)
    }()

    func testCodability() {
        let encodedData = try! PropertyListEncoder().encode(cacheableDog)
        let propertyList = try! PropertyListSerialization.propertyList(
            from: encodedData,
            format: nil
        )

        let decodedData = try! PropertyListSerialization.data(
            fromPropertyList: propertyList,
            format: .binary,
            options: 0
        )
        let decodedDog = try! PropertyListDecoder().decode(CacheableDog.self, from: decodedData)

        XCTAssertEqual(cacheableDog.name, decodedDog.name)
        XCTAssertEqual(cacheableDog.age, decodedDog.age)
        XCTAssertEqual(cacheableDog.imageData, decodedDog.imageData)
    }

    func testMappingFromCanonical() {
        cacheableDog = CacheableDogBuilder.buildCacheableDog(from: dog)

        XCTAssertEqual(cacheableDog.name, dog.name)
        XCTAssertEqual(cacheableDog.age, UInt(dog.age))
        XCTAssertEqual(cacheableDog.imageData, dog.image)
    }

    func testMappingToCanonical() {
        dog = CacheableDogBuilder.buildDog(from: cacheableDog)

        XCTAssertEqual(dog.name, cacheableDog.name)
        XCTAssertEqual(dog.age, Int(cacheableDog.age))
        XCTAssertEqual(dog.image, cacheableDog.imageData)
    }

}
