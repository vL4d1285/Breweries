//
//  MainTableViewController.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 12.04.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var breweries: [Brewery] = []
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchBreweries(from: Links.list.rawValue) { result in
            switch result {
            case .success(let breweries):
                self.breweries = breweries
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breweries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let brewery = breweries[indexPath.row]
        cell.configure(with: brewery)
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let brewery = breweries[indexPath.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.brewery = brewery 
    }


}
