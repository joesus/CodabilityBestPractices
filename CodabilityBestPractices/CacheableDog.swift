//
//  CacheableDog.swift
//  CodabilityBestPractices
//
//  Created by Joe Susnick on 3/3/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

import Foundation

struct CacheableDog: Codable {
    let name: String
    let age: UInt
    let imageData: Data
}
