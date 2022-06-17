//
//  FavoriteViewController.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 27.05.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    var favoriteBreweries: [Brewery] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteBreweries = StorageManager.shared.fetchBreweries()
    }
    
    @IBAction func cleanAction() {
        favoriteBreweries = []
        // сделать функцию очистки UD
        tableView.reloadData()
    }
    
    
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteBreweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = favoriteBreweries[indexPath.row].name
        
        cell.contentConfiguration = content
        
                               
        return cell
    }
    
    
}



