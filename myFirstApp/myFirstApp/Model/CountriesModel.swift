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

struct CapitalInfo: Codable {
    var latlng: [Double]?
}
struct Country: Codable, Identifiable {   //label the Country struct as codable and identifiable
    //identifiable labels must have an id variable
    var id: Int { return UUID().hashValue }
    var name: CountryName
    var capital: [String]?
    var flag: String
    var population: Int
    var languages: [String: String]?
    var car: Car
    var capitalInfo: CapitalInfo
}

struct Car: Codable {
    var side: String
}
