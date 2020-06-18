//
//  SpeciesController.swift
//  SWAPIApp
//
//  Created by Hunter McNeil on 6/17/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import Foundation

struct StringConstants {
    fileprivate static let baseURLString = "https://swapi.dev"
    fileprivate static let APIURLString = "api"
    fileprivate static let speciesComponentString = "species"
}

class SpeciesController {
    static func fetchSpecies(searchTerm: String, completion: @escaping (Result<Species, SpeciesError>) -> Void) {
        guard let baseURL = URL(string: StringConstants.baseURLString) else {return completion(.failure(.invalidURL))}
        let apiURL = baseURL.appendingPathComponent(StringConstants.APIURLString)
        let finalURL = apiURL.appendingPathComponent(StringConstants.speciesComponentString)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let species = topLevelDictionary.results
                var filteredSpecies: [Species] = []
                for species in species {
                    if species.name.lowercased() == searchTerm.lowercased() {
                        filteredSpecies.append(species)
                    }
                }        
                if filteredSpecies.count > 0 {
                completion(.success(filteredSpecies[0]))
                } else {
                    return completion(.failure(.noData))
                }
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
}
