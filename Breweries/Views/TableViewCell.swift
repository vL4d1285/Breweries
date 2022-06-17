//
//  TableViewCell.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 13.04.2022.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didTapButton(with brewery: Brewery)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?
   
    @IBOutlet var nameOutlet: UILabel!
    @IBOutlet var typeOutlet: UILabel!
    @IBOutlet var addressOutlet: UILabel!
    @IBOutlet var cityOutlet: UILabel!
    @IBOutlet var favoriteButtonOutlet: UIButton!
    
    private var favoriteBrewery: Brewery?
    
    private var isFavorite = false
       
    @IBAction func favoriteButtonAction() {
        guard let brewery = favoriteBrewery else { return }
        guard let breweryName = brewery.name else { return }
        delegate?.didTapButton(with: brewery)
        
        isFavorite.toggle()
        StorageManager.shared.setFavoriteStatus(for: breweryName, with: isFavorite)
        setImageForFavoriteButton()
    }
    
    func configure(with brewery: Brewery) {
        self.favoriteBrewery = brewery
        nameOutlet.text = brewery.name
        typeOutlet.text = brewery.brewery_type
        addressOutlet.text = "\(brewery.street ?? "")"
        cityOutlet.text = "\(brewery.city ?? "")"
        
        loadFavoriteStatus(for: brewery.name!)
        setImageForFavoriteButton()
    }
    
    private func setImageForFavoriteButton() {
        favoriteButtonOutlet.setImage(
            UIImage(systemName: isFavorite ? "star.fill" : "star"), for: .normal
        )
    }
    
    private func loadFavoriteStatus(for breweryName: String) {
        isFavorite = StorageManager.shared.getFavoriteStatus(for: breweryName)
    }
    
    
    
    
    
}
