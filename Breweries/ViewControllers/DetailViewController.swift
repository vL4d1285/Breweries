//
//  ViewController.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 11.04.2022.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet var descriptionOutlet: UILabel!
    @IBOutlet var websiteOutlet: UIButton!
     
    @IBOutlet var mapView: MKMapView!
    
    var brewery: Brewery!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupWebsiteLink(websiteOutlet)
        setupPlacemarkOnTheMap()
    }

    @IBAction func urlLinkButton() {
        if let url = URL(string: brewery.website_url ?? "") {
            UIApplication.shared.open(url)
        }
    }
            
    private func setupUI() {
        descriptionOutlet.text = brewery.description
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = brewery.name
        navigationItem.enableMultilineTitle()
    }
    
    private func setupWebsiteLink(_ link: UIButton) {
        // remake, remove !
        guard let websiteUrl = brewery.website_url else { return }
        link.setTitle(websiteUrl, for: .normal)
        link.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            link.titleLabel!.leadingAnchor.constraint(equalTo: link.leadingAnchor)
        ])
    }
      
    private func setupPlacemarkOnTheMap() {
        let annotation = MKPointAnnotation()
        annotation.title = brewery.name
        annotation.subtitle = brewery.brewery_type
                
        if brewery.latitude != nil && brewery.longitude != nil {
            let latitude = NSString(string: brewery.latitude ?? "").doubleValue
            let longitude = NSString(string: brewery.longitude ?? "").doubleValue
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            annotation.coordinate = coordinate
            mapView.showAnnotations([annotation], animated: false)
            print(annotation.coordinate)
        } else {
            guard let address = brewery.street else { return }
            
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address) { (placemarks, error) in
                
                if let error = error {
                    print(error)
                    return
                }
                guard let placemarks = placemarks else { return }
                let placemark = placemarks.first
                
                guard let placemarkLocation = placemark?.location else { return }
                annotation.coordinate = placemarkLocation.coordinate
                self.mapView.showAnnotations([annotation], animated: false)
            }
        }
    }
}

extension UINavigationItem {
    func enableMultilineTitle() {
          setValue(true, forKey: "__largeTitleTwoLineMode")
       }
}
