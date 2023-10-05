//
//  CountriesModel.swift
//  myFirstApp
//
//  Created by ATLAS Laptop 4 Guest on 10/5/23.
//

import SwiftUI

struct CountryName: Codable {
    var common: String
    var official: String
}

struct Country: Codable, Identifiable {   //label the Country struct as codable and identifiable
    //identifiable labels must have an id variable
    var id: Int { return UUID().hashValue }
    var name: CountryName
    var capital: [String]?
    var flag: String
    var population: Int
//    var currencies: [String]?
//    var translations: Array<String>
//    var language: [String: String]?
    var car: Car
}

struct Car: Codable {
    var side: String
}
