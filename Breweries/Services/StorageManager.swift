//
//  StorageManager.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 26.05.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "Brewery"
    
    private init() {}
    
    func save(brewery: Brewery) {
        var breweries = fetchBreweries()
        breweries.append(brewery)
        guard let data = try? JSONEncoder().encode(breweries) else { return }
        userDefaults.set(data, forKey: key)
        
    }
    
    func fetchBreweries() -> [Brewery] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        guard let breweries = try? JSONDecoder().decode([Brewery].self, from: data) else { return [] }
        return breweries
    }
    
    func deleteBrewery(at index: Int) {
        var breweries = fetchBreweries()
        breweries.remove(at: index)
        guard let data = try? JSONEncoder().encode(breweries) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func setFavoriteStatus(for breweryName: String, with status: Bool) {
        userDefaults.set(status, forKey: breweryName)
    }
    
    func getFavoriteStatus(for breweryName: String) -> Bool {
        userDefaults.bool(forKey: breweryName)
    }
    
}
