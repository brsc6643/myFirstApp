//
//  ContentView.swift
//  lect10-11
//
//  Created by ATLAS Laptop 4 Guest on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = NewViewModel()
    var body: some View {
        VStack {
            NavigationLink(destination: NameView()) {
                Text("Class exercise")
            }
        }
        .padding()
        Text("You entered: \(viewModel.nameHolding)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
