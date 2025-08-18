import Foundation
import FirebaseAuth
import AuthenticationServices
import CryptoKit
import SwiftUI

final class FirebaseAuthService: NSObject, ObservableObject {
    @Published var user: User? = nil

    func signInWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<User, Error>) -> Void) {
        guard let token = credential.identityToken, let tokenString = String(data: token, encoding: .utf8) else {
            completion(.failure(NSError(domain: "Auth", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid token"])))
            return
        }
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nil)

        Auth.auth().signIn(with: firebaseCredential) { result, error in
            if let error = error { completion(.failure(error)); return }
            guard let fuser = result?.user else { completion(.failure(NSError())); return }
            let u = User(id: fuser.uid, displayName: fuser.displayName, email: fuser.email)
            self.user = u
            completion(.success(u))
        }
    }

    func signOut() throws {
        try Auth.auth().signOut()
        user = nil
    }
}
