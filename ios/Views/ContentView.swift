import SwiftUI

struct ContentView: View {
    @StateObject private var lm = LocationManager()

    var body: some View {
        TabView {
            MapScene()
                .tabItem { Label("Explore", systemImage: "map") }

            Text("Trips")
                .tabItem { Label("Trips", systemImage: "list.bullet") }

            Text("Profile")
                .tabItem { Label("Profile", systemImage: "person.crop.circle") }
        }
        .onAppear { lm.requestAuthorization() }
    }
}
