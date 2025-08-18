Firebase Setup Steps
1) Create a Firebase project at https://console.firebase.google.com/
2) Add an iOS app; use your bundle identifier; download GoogleService-Info.plist into ios/Resources/
3) In Xcode: File > Swift Packages > Add Package Dependency -> https://github.com/firebase/firebase-ios-sdk
   Add FirebaseAuth and FirebaseCore (and Firestore/Storage if needed)
4) In Firebase Console -> Authentication -> Sign-in method -> enable Apple and Email/Password
5) Configure Sign in with Apple on Apple Developer portal and link to Firebase as required.
6) Ensure 'Sign in with Apple' capability is added to your Xcode target (Signing & Capabilities)
7) Run the app and use SignInWithAppleView; pass credential to FirebaseAuthService.signInWithApple

Note: For a production app implement nonce handling for Apple sign-in (use CryptoKit) and verify ID token server-side if needed.
