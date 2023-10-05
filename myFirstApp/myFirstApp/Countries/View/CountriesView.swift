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
    
    @State var countries = [Country]()
    @State var selectedCountry: Country?
    @State var isLoading = false
    
    @ObservedObject var viewModel = CountriesViewModel()
 
    var body: some View {
        NavigationView {
            //lecture notes
            if isLoading {
                Text("Loading...")
            }
            VStack {
                Text("Please browse the world's countries below.")
 
                Button("Press to dismiss") {
                    dismiss()
                }
 
                List(countries) { country in
                    VStack(alignment: .leading) {
                        Button(action: {
                            selectedCountry = country // Set the selected country
                        }) {
                            Text("\(country.flag) \(country.name.common) \n Official Name: \(country.name.official)")
                        }
                    }
                }
                .task {
                    print("Running task.")
                    getAllCountries()
                    print("Completed task.")
                }
                if isLoading{
                    ProgressView()
                }
                else {
                    Text("Loading complete.").bold()
                }
            }
            .sheet(item: $selectedCountry) { country in
                CountryDetailView(country: country) // Display the detail view when a country is selected
                Button("Press to dismiss") {
                    dismiss()
                }
            }
            .navigationTitle("Countries")
            .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                NavigationLink(destination: CountrySearchView(countries: $countries)) {
                                    Image(systemName: "magnifyingglass")
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
