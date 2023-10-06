//
//  CountriesViewModel.swift
//  myFirstApp
//
//  Created by ATLAS Laptop 4 Guest on 10/5/23.
//

import SwiftUI

class CountriesViewModel:
    ObservableObject {
        
        @Published var countries = [Country]()
        @Published var selectedCountry: Country?
        @Published var isLoading = false
    
        init(){
            getAllCountries()
        }
    
        
        func getAllCountries() {
            Task { @MainActor in
                do {
                    let url = URL(string: "https://restcountries.com/v3.1/all")!
                    //use let to assign shared data from the url into the variable data
                    //use the await instruction to allow the data from the URL to be retrieved before continuing with execution
                    let (data, _) = try await URLSession.shared.data(from: url)
                    print(data) //print the data to see where we are
                    //use a try and catch block with JSONDecoder(),decode([JSONstruct].self, from: data to decode JSON above
                    countries = try JSONDecoder().decode([Country].self, from: data)
                }
                catch { //catch errors by outputting the appropriate error description
                    print("Error: \(error.localizedDescription)")
                }
            }
            
        }
    }
