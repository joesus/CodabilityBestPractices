//
//  RemoteDogTests.swift
//  CodabilityBestPracticesTests
//
//  Created by Joe Susnick on 3/3/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

@testable import CodabilityBestPractices
import XCTest

class RemoteDogTests: XCTestCase {

    let imageData = "sample-data".data(using: .utf8)!

    lazy var imageString: String = {
        return imageData.base64EncodedString()
    }()

    lazy var remoteValues: [String: Any] = {
        return  [
            "dog_name": "Fido",
            "age_in_years": "3",
            "media": imageString
        ]
    }()

    lazy var remoteDog: RemoteDog = {
        return try! JSONDecoder().decode(RemoteDog.self, from: data)
    }()

    lazy var data: Data = {
        return try! JSONSerialization.data(withJSONObject: remoteValues, options: [])
    }()

    func testDecoding() {
        XCTAssertEqual(remoteDog.dog_name, "Fido")
        XCTAssertEqual(remoteDog.age_in_years, "3")
        XCTAssertEqual(remoteDog.media, imageString)
    }

    func testMappingToCanonical() {
        guard let dog = RemoteDogBuilder.buildDog(from: remoteDog) else {
            return XCTFail()
        }

        XCTAssertEqual(dog.name, "Fido")
        XCTAssertEqual(dog.age, 3)
        XCTAssertEqual(dog.image, imageData)
    }

}
