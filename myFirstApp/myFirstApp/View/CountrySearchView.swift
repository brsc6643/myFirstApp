//
//  SearchView.swift
//  hw3
//
//  Created by Broderick Ryan Schmidt on 9/15/23.
//

import SwiftUI
 
struct CountrySearchView: View {
    @Binding var countries: [Country]
    @State private var searchText = ""
   
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { country in
                // You can customize the search criteria here.
                let commonNameContains = country.name.common.localizedCaseInsensitiveContains(searchText)
                let officialNameContains = country.name.official.localizedCaseInsensitiveContains(searchText)
                return commonNameContains || officialNameContains
            }
        }
    }
   
    var body: some View {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search Countries")
               
                List(filteredCountries) { country in
                    NavigationLink(destination: CountryDetailView(country: country)) {
                        VStack(alignment: .leading) {
                            Text("\(country.flag) \(country.name.common)")
                            Text("Official Name: \(country.name.official)")
                        }
                    }
                }
            }
            .navigationTitle("Search Countries")
    }
}

