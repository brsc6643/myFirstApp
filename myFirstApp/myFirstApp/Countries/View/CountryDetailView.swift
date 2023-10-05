//
//  CountryDetailView.swift
//  myFirstApp
//
//  Created by ATLAS Laptop 4 Guest on 10/5/23.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country
 
    var body: some View {
        VStack(alignment: .leading) {
            Text("Common Name: \(country.name.common)")
            Text("Official Name: \(country.name.official)")
            Text("Capital: \(country.capital?.joined(separator: ", ") ?? "N/A")")
            Text("Population: \(country.population)")
            Text(String("Car: \(country.car.side)"))
//            if let currency = country.currencies {
//                                    Text("Currency: \(currency.joined(separator: ", "))")
//                                }
//            Text(getLanguages(language: country.language!))
//            Text("Translations: \(country.translations ?? "N/A")")
            
        }
        .navigationTitle("Country Details")
    }
}
