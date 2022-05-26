//
//  NetworkManager.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 11.04.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchBreweries(from url: String, completion: @escaping(Result<[Brewery], NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let breweries = try JSONDecoder().decode([Brewery].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(breweries))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
        
        
    }
    
}
