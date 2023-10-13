////
////  CountryMapView.swift
////  lec10-9-maps-notifications
////
////  Created by ATLAS Laptop 4 Guest on 10/9/23.
////
//
//import SwiftUI
//import MapKit
//
//struct CountryMapView: View {
//    
//    @ObservedObject var appViewModel: CountriesViewModel
//    
//    var countriesWithCapitalsWithCoordinates: [Country] {
//        return appViewModel.countries.filter({country in country.capitalInfo.coordinate != nil})
//    }
//    
//    var body: some View {
//        //this changed in iOS 17. change target version
//        Map {
//            ForEach(countriesWithCapitalsWithCoordinates) {country in MapMarker(country.capital?.first ?? "(None)", coordinate: country.capitalInfo.coordinate!) {
//                    NavigationLink {
//                        CountriesView(country: country)
//                    }
//                    label: {
//                        Circle().stroke(.red, lineWidth: 3)
//                            .fill(.orange)
//                            .frame(width: 20, height: 20)
//                            .shadow(radius:10)
//                    }
//                }
//            }
//        }
//        .mapStyle(.imagery(elevation: ,realistic))
//        .mapControls {
//            MapUserLocationButton()
//            MapCompass()
//        }
//    }
//}
//
