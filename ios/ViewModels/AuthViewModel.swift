import Foundation
import Combine

final class AuthViewModel: ObservableObject {
    @Published var firebaseUser: User?
    private let service = FirebaseAuthService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        service.$user.assign(to: \.$firebaseUser, on: self).store(in: &cancellables)
    }
}
