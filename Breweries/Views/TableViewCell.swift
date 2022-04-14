//
//  TableViewCell.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 13.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet var nameOutlet: UILabel!
    @IBOutlet var typeOutlet: UILabel!
    @IBOutlet var addressOutlet: UILabel!
    @IBOutlet var cityOutlet: UILabel!
    
    @IBAction func favoriteButtonAction() {
    }
    

    func configure(with brewery: Brewery) {
        nameOutlet.text = brewery.name
        typeOutlet.text = brewery.brewery_type
        addressOutlet.text = "\(brewery.street ?? "")"
        cityOutlet.text = "\(brewery.city ?? "")"
    }
    
    
}
