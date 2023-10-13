//
//  LocationManager.swift
//  myFirstApp
//
//  Created by ATLAS Laptop 4 Guest on 10/13/23.
//

import CoreLocation
import UIKit

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if userLocation != nil {return}
        guard let location = locations.last else {return}
        
        userLocation = location.coordinate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let pushNotificationService = PushNotificationService()
        pushNotificationService.requestPermissions()
        return true
    }
    
}
