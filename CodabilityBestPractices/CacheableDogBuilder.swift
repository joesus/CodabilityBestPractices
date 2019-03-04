//
//  CacheableDogBuilder.swift
//  CodabilityBestPractices
//
//  Created by Joe Susnick on 3/3/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

import Foundation

enum CacheableDogBuilder {

    static func buildDog(from cacheableDog: CacheableDog) -> Dog {
        return Dog(
            name: cacheableDog.name,
            age: Int(cacheableDog.age),
            image: cacheableDog.imageData
        )
    }

    static func buildCacheableDog(from dog: Dog) -> CacheableDog {
        return CacheableDog(
            name: dog.name,
            age: UInt(dog.age),
            imageData: dog.image
        )
    }

}
