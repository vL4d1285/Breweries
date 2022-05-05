//
//  ViewController.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 11.04.2022.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet var typeOutlet: UILabel!
    @IBOutlet var phoneOutlet: UILabel!
    @IBOutlet var websiteOutlet: UIButton!
    
    @IBOutlet var locationOutlet: UILabel!
    
    @IBOutlet var mapViewOutlet: MKMapView!
    
    
    var brewery: Brewery!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeOutlet.text = brewery.brewery_type
        phoneOutlet.text = brewery.phone
        locationOutlet.text = brewery.street
        
        setupNavigationBar()
        setupWebsiteLink(websiteOutlet)
                       
    }

    @IBAction func button() {
        if let url = URL(string: brewery.website_url ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = brewery.name
        navigationItem.enableMultilineTitle()
    }
  
    private func setupWebsiteLink(_ link: UIButton) {
        // remake, remove !
        link.setTitle(brewery.website_url, for: .normal)
        link.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            link.titleLabel!.leadingAnchor.constraint(
                equalTo: link.leadingAnchor)])
    }
        
}

extension UINavigationItem {
    func enableMultilineTitle() {
          setValue(true, forKey: "__largeTitleTwoLineMode")
       }
}





