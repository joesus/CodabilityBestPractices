//
//  RemoteDog.swift
//  CodabilityBestPractices
//
//  Created by Joe Susnick on 3/3/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

import Foundation

struct RemoteDog: Decodable {
    let dog_name: String
    let age_in_years: String
    let media: String
}
