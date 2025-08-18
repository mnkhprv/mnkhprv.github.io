import SwiftUI
import MapKit

struct MapScene: View {
    @StateObject private var vm = MapViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $vm.region, showsUserLocation: true, annotationItems: vm.places) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    PlacePinView(place: place)
                        .onTapGesture { vm.select(place) }
                }
            }
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 8) {
                SearchBar(text: $vm.searchText)
                    .padding(.horizontal)

                Spacer()
            }
        }
        .sheet(item: $vm.selectedPlace) { place in
            PlaceDetailView(place: place)
        }
    }
}
