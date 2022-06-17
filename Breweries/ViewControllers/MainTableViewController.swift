//
//  MainTableViewController.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 12.04.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
         
    var breweries: [Brewery] = []
    var page = 1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()        
        loadBreweries(from: Links.list.rawValue)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breweries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! TableViewCell
    
        cell.configure(with: breweries[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRow = indexPath.row
        if lastRow == breweries.count - 1 {
            let url = Links.page.rawValue + "\(page += 1)"
            loadBreweries(from: url)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let brewery = breweries[indexPath.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.brewery = brewery 
    }
        
    private func loadBreweries(from link: String) {
        NetworkManager.shared.fetchBreweries(from: link) { result in
            switch result {
            case .success(let breweries):
                self.breweries.append(contentsOf: breweries)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
        
    private func configureRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(
            self,
            action: #selector(handleRefreshControl),
            for: .valueChanged
        )
    }
    
    @objc func handleRefreshControl() {
        loadBreweries(from: Links.list.rawValue)
        breweries.shuffle()
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
}

extension MainTableViewController: TableViewCellDelegate {
    func didTapButton(with brewery: Brewery) {
        StorageManager.shared.save(brewery: brewery)
    }
}
