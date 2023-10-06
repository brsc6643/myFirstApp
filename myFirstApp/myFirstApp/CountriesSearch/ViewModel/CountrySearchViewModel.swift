////
////  CountrySearchViewModel.swift
////  myFirstApp
////
////  Created by ATLAS Laptop 4 Guest on 10/6/23.
////
//
//import SwiftUI
//
//class CountrySearchViewModel : ObservableObject {
//    @Published var countries: [Country]
//    @State private var searchText = ""
//
//    init() {
//
//        var filteredCountries: [Country] {
//            if searchText.isEmpty {
//                return countries
//            }
//            else {
//                return countries.filter { country in
//                    // You can customize the search criteria here.
//                    let commonNameContains = country.name.common.localizedCaseInsensitiveContains(searchText)
//                    let officialNameContains = country.name.official.localizedCaseInsensitiveContains(searchText)
//                    return commonNameContains || officialNameContains
//                }
//            }
//        }
//    }
//}
//
//func filteredCountries(countries: [Country]) {
//    @Published var countries: [Country]
//    @State private var searchText = ""
//
//    if searchText.isEmpty {
//        return countries
//    }
//    else {
//        return countries.filter { country in
//            let commonNameContains = country.name.common.localizedCaseInsensitiveContains(searchText)
//            let officialNameContains = country.name.official.localizedCaseInsensitiveContains(searchText)
//            return commonNameContains || officialNameContains
//        }
//    }
//}
