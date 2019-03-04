//
//  RemoteDogBuilder.swift
//  CodabilityBestPractices
//
//  Created by Joe Susnick on 3/3/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

import Foundation
import UIKit

enum RemoteDogBuilder {

    static func buildDog(from remoteDog: RemoteDog) -> Dog? {
        guard let age = Int(remoteDog.age_in_years),
            let imageData = Data(base64Encoded: remoteDog.media)
            else {
                return nil
        }

        return Dog(
            name: remoteDog.dog_name,
            age: age,
            image: imageData
        )
    }

}
