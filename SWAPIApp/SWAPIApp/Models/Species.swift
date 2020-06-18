//
//  Species.swift
//  SWAPIApp
//
//  Created by Hunter McNeil on 6/17/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let results: [Species]
}

struct Species: Decodable {
    let name: String
    let language: String
}
