import Foundation

struct User: Identifiable, Codable {
    let id: String
    var displayName: String?
    var email: String?
    var avatarURL: URL?
}
