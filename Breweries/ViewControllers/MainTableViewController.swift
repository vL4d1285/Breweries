//
//  MainTableViewController.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 12.04.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var breweries: [Brewery] = [
        Brewery(name: "Test Brewery",
                breweryType: "bar",
                street: "test street",
                city: "New York",
                state: "non",
                country: "USA",
                longitude: "non",
                latitude: "non",
                phone: "989-656-59",
                websiteUrl: "www.google.com"),
        Brewery(name: "Test Brewery Two",
                breweryType: "brewery",
                street: "test street two",
                city: "New York",
                state: "non",
                country: "USA",
                longitude: "non",
                latitude: "non",
                phone: "989-656-59",
                websiteUrl: "www.google.com"),
        Brewery(name: "Test Brewery Three",
                breweryType: "pab",
                street: "test street three",
                city: "LA",
                state: "non",
                country: "USA",
                longitude: "non",
                latitude: "non",
                phone: "9-6-9",
                websiteUrl: "www.google.com"),
    ]
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breweries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = breweries[indexPath.row].name
    
        cell.contentConfiguration = content

        return cell
    }

    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
