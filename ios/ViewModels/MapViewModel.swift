import Foundation
import MapKit
import Combine

final class MapViewModel: ObservableObject {
    @Published var region: MKCoordinateRegion
    @Published var places: [Place] = []
    @Published var searchText: String = ""
    @Published var selectedPlace: Place? = nil

    private let mapSearch = MapSearchService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.918, longitude: 106.917), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

        $searchText
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] q in
                guard let self = self else { return }
                if q.count >= 2 {
                    self.search(query: q)
                } else {
                    self.places = []
                }
            }
            .store(in: &cancellables)
    }

    func search(query: String) {
        mapSearch.search(query: query, center: region.center) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let places): self?.places = places
                case .failure(let err): print("Search error:\(err)")
                }
            }
        }
    }

    func select(_ place: Place) { selectedPlace = place }
}
