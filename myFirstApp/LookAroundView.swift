//
//  LookAroundView.swift
//  myFirstApp
//
//  Created by ATLAS Laptop 4 Guest on 10/13/23.
//

import SwiftUI
import MapKit

struct LookAroundView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = MKLookAroundViewController
    
    @Binding var tappedLocation: CLLocationCoordinate2D?
    @Binding var showLookAroundView: Bool
    
    func makeUIViewController(context: Context) -> MKLookAroundViewController {
        return MKLookAroundViewController()
    }
    
    func updateUIViewController(_ uiViewController: MKLookAroundViewController, context: Context) {
        if let tappedLocation {
            Task {
                if let scene = await getScene(tappedLocation: .init(latitude: tappedLocation.latitude, longitude: tappedLocation.longitude)) {
                        withAnimation {
                            self.showLookAroundView = true
                            uiViewController.scene = scene
                        }
                }
                else {
                    withAnimation {
                        self.showLookAroundView = false
                    }
                    return
                }
            }
        }
    }
    
    func getScene(tappedLocation: CLLocationCoordinate2D?) async -> MKLookAroundScene? {
        if let lat = tappedLocation?.latitude, let long = tappedLocation?.longitude {
            let sceneRequest = MKLookAroundSceneRequest(coordinate: .init(latitude: lat, longitude: long))
            
            do {
                return try await sceneRequest.scene
            }
            
            catch {
                print(error)
                return nil
            }
        }
        else {
            return nil
        }
    }
}
