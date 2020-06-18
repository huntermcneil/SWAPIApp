//
//  SpeciesError.swift
//  SWAPIApp
//
//  Created by Hunter McNeil on 6/17/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import Foundation

enum SpeciesError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    
}
