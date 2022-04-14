//
//  Brewery.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 11.04.2022.
//

import Foundation

struct Brewery: Decodable {
    let id: String?
    let name: String?
    let brewery_type: String?
    let street: String?
    let address_2: String?
    let address_3: String?
    let city: String?
    let state: String?
    let county_province: String?
    let postal_code: String?
    let country: String?
    let longitude: String?
    let latitude: String?
    let phone: String?
    let website_url: String?
    let updated_at: String?
    let created_at: String?
       
}

enum Links: String {
    case list = "https://api.openbrewerydb.org/breweries"
}
