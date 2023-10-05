//
//  hw3App.swift
//  hw3
//
//  Created by Broderick Ryan Schmidt on 9/15/23.
//
import Foundation
import SwiftUI

@main
struct myFirstAppApp: App {
       @AppStorage("isDarkMode") private var isDarkMode = false
        var body: some Scene {
                WindowGroup {
                 ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
       }
    }
}

