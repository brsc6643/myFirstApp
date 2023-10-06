import SwiftUI

struct ContentView: View {
    @State var switched: Bool = false
    @State private var showingSheet = false
    @State private var showAlert = false
    @State private var searchpage = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack{
            
//            NavigationView() {
////                NavigationLink(destination: SearchView()) {
////                    Text("Country of the Day").padding().background(Color.accentColor)
////                        .foregroundColor(.white)
////                }
//                .navigationBarTitle("Home Page", displayMode: .inline)
//            }
            
            VStack {
                HStack {
                    Image(systemName: "person")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Image(systemName: "person")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Image(systemName: "person")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Image(systemName: "person")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Image(systemName: "person")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                .padding()
                
                HStack {
                    Image(systemName: "globe.americas.fill")
                        .imageScale(.large)
                    Text("CountryFinder")
                }
                .font(.title)
                .foregroundColor(.accentColor)
                
                VStack {
                    HStack {
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                    .padding()
                }
                HStack{
                    Label("Dark Mode", systemImage: "moon.fill")
                    Toggle("Dark Mode", isOn: $isDarkMode) .foregroundColor(Color.accentColor)
                        .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        .frame(width: 60, height: 30, alignment: .center)
                }
                Button("Display Countries") {
                    showingSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .frame(height: 100)
                .sheet(isPresented: $showingSheet) {
                    CountriesView()
                }
            }
            
// tabview Code
            
        
//            TabView {
//                LightModeView(colorScheme: $colorScheme)
//                    .tabItem {
//                        Label("Light Mode Ready", systemImage: "sun.max.fill")
//                    }
//
//                DarkModeView(colorScheme: $colorScheme)
//                    .tabItem {
//                        Label("Dark Mode Ready", systemImage: "moon.fill")
//                    }
//            }
        }
    } //end body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
