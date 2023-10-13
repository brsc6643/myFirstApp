//
//  CountriesView.swift
//  hw3
//
//  Created by Broderick Ryan Schmidt on 9/15/23.
//
//

import SwiftUI
 
 
struct CountriesView: View {
    @Environment(\.dismiss) var dismiss
    
    
    @StateObject private var viewModel = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            //lecture notes
            if viewModel.isLoading {
                Text("Loading...")
            }
            VStack {
                Text("Please browse the world's countries below.")
                
                Button("Press to dismiss") {
                    dismiss()
                }
                
                List(viewModel.countries) { country in
                    VStack(alignment: .leading) {
                        Button(action: {
                            viewModel.selectedCountry = country // Set the selected country
                            let pushNotificationService = PushNotificationService()
                            pushNotificationService.scheduleNotification(title: "Hello", subtitle: "World")
                        }) {
                            Text("\(country.flag) \(country.name.common) \n Official Name: \(country.name.official)")
                        }
                    }
                }
                .sheet(item: $viewModel.selectedCountry) { country in
                    CountryDetailView(country: country) // Display the detail view when a country is selected
                    Button("Press to dismiss") {
                        dismiss()
                    }
                    
                }
                .navigationTitle("Countries")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CountrySearchView(countries: $viewModel.countries)) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
        }
    }
}
//func getLanguages(language: [String: String]) -> String {
//    var availableLanguages = ""
//    for (key, value) in language {
//        availableLanguages = ("\(availableLanguages) \(value)")
//    }
//    return availableLanguages
//}

struct CountriesView_Previews: PreviewProvider { //previewProvider struct to display preview
    static var previews: some View {
        CountriesView() //initial countriesView displayed in provider
    }
}
