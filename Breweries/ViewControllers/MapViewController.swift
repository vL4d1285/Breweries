//
//  MapViewController.swift
//  Breweries
//
//  Created by Vladislav Ryabtsev on 12.04.2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
        
    let locationManager = CLLocationManager()
    
    @IBOutlet var settingsButtonOutlet: UIButton!
    @IBOutlet var locationButtonOutlet: UIButton!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsButtonOutlet.isHidden = true
        locationButtonOutlet.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationServices()
    }
    
    
    @IBAction func settingsButtonAction() {
        if let url = URL(string: "app-settings:root=LOCATION_SERVICES") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func locationButtonAction() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: 500,
                                            longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorisation()
        } else {
            settingsButtonOutlet.isHidden = false
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorisation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case.authorizedAlways, .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationButtonOutlet.isEnabled = true
        default:
            settingsButtonOutlet.isHidden = false
            locationButtonOutlet.isEnabled = false
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorisation()
    }
    
}
