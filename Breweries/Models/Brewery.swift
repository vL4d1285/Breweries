//
//  Brewery.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 11.04.2022.
//

import Foundation

struct Brewery {
    let name: String
    let breweryType: String
    let street: String
    let city: String
    let state: String
    let country: String
    let longitude: String
    let latitude: String
    let phone: String
    let websiteUrl: String
    
    
      

}

enum Links: String {
    case list = "https://api.openbrewerydb.org/breweries"
}
