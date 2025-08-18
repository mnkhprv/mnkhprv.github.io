import Foundation
import CoreLocation

struct Place: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let coordinate: CLLocationCoordinate2D
    let address: String?
    let category: String?
    let rating: Double?
    let phone: String?
    let website: URL?

    enum CodingKeys: String, CodingKey {
        case id, name, address, category, rating, phone, website, lat, lng
    }
}
