//
//  SpeciesViewController.swift
//  SWAPIApp
//
//  Created by Hunter McNeil on 6/17/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import UIKit

class SpeciesViewController: UIViewController {
    @IBOutlet weak var speciesSearchBar: UISearchBar!
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var languageTextField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speciesSearchBar.delegate = self
    }
    
    func updateViews(species: Species) {
        DispatchQueue.main.async {
            self.nameTextField.text = species.name
            self.languageTextField.text = species.language
        }
    }
}

extension SpeciesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        SpeciesController.fetchSpecies(searchTerm: searchTerm) { (result) in
            switch result {
            case .success(let species):
                self.updateViews(species: species)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
