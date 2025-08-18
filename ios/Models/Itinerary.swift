import Foundation

struct Itinerary: Identifiable, Codable {
    let id: String
    var title: String
    var stops: [ItineraryStop]
    var ownerId: String
}

struct ItineraryStop: Codable, Hashable {
    var placeId: String
    var order: Int
    var arrival: Date?
    var notes: String?
}
