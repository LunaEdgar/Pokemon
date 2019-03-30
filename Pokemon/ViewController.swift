//
//  ViewController.swift
//  Pokemon
//
//  Created by LABMAC26 on 01/03/19.
//  Copyright © 2019 UTNG. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController,CLLocationManagerDelegate{

    var mapView:GMSMapView!
    let locationManager = CLLocationManager()
    var listPockemon = [Pockemons]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 43, longitude: -77, zoom: 10)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    var oldLocatin = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        oldLocatin = manager.location!.coordinate
        
        let markerMe = GMSMarker()
        markerMe.position = CLLocationCoordinate2D(latitude: oldLocatin.latitude, longitude: oldLocatin.longitude)
        markerMe.title = "Me"
        markerMe.snippet = "here is my location"
        markerMe.icon = UIImage(named:"Charmander")
        markerMe.map = self.mapView
        let camera = GMSCameraPosition.camera(withLatitude: oldLocatin.latitude, longitude: oldLocatin.longitude, zoom: 15)
        
        self.mapView.camera = camera
        
        
    }
    
    
    
    
}
