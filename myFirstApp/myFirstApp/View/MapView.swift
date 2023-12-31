//
//  MapView.swift
//  myFirstApp
//
//  Created by ATLAS Laptop 4 Guest on 10/13/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    @Binding var tappedLocation: CLLocationCoordinate2D?

    @StateObject var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        mapView.showsUserLocation = true
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action:
                                                    #selector(MapViewCoordinator.tappedOnMap(_:)))
        
        mapView.addGestureRecognizer(tapGesture)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if uiView.delegate != nil {return}
        if let userLocation = locationManager.userLocation {
            uiView.setRegion(.init(center: userLocation, latitudinalMeters: 400, longitudinalMeters: 400), animated: false)
            
            uiView.delegate = context.coordinator
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self, tappedLocation: $tappedLocation)
    }
}

final class MapViewCoordinator: NSObject, MKMapViewDelegate {
    @Binding var tappedLocation: CLLocationCoordinate2D?
    
    var parent: MapView
    
    init(_ mapView: MapView, tappedLocation: Binding<CLLocationCoordinate2D?>) {
        self.parent = mapView
        self._tappedLocation = tappedLocation
    }
    
    @objc func tappedOnMap(_ sender: UITapGestureRecognizer) {
        guard let mapView = sender.view as? MKMapView else {return}
        
        let touchLocation = sender.location(in: sender.view)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: sender.view)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = .init(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        self.tappedLocation = locationCoordinate
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotation)
        
        //push implementations
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let notification = PushNotificationService()
            notification.scheduleNotification(title: "You dropped a pin!", subtitle: "Tap here to return to the map.")
        }
    }
}
