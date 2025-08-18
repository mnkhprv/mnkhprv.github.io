import Foundation
import MapKit
import Combine

final class MapSearchService {
    func search(query: String, center: CLLocationCoordinate2D?, radius: Double = 5000, completion: @escaping (Result<[Place], Error>) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        if let center = center {
            request.region = MKCoordinateRegion(center: center, latitudinalMeters: radius * 2, longitudinalMeters: radius * 2)
        }
        let search = MKLocalSearch(request: request)
        search.start { resp, err in
            if let err = err { completion(.failure(err)); return }
            guard let mapItems = resp?.mapItems else { completion(.success([])); return }
            let places = mapItems.map { item -> Place in
                let id = item.placemark.postalAddress?.street ?? item.name ?? UUID().uuidString
                let place = Place(id: id,
                                  name: item.name ?? "Unknown",
                                  coordinate: item.placemark.coordinate,
                                  address: [item.placemark.thoroughfare, item.placemark.locality, item.placemark.country].compactMap { $0 }.joined(separator: ", "),
                                  category: item.pointOfInterestCategory?.rawValue,
                                  rating: nil,
                                  phone: item.phoneNumber,
                                  website: item.url)
                return place
            }
            completion(.success(places))
        }
    }
}
