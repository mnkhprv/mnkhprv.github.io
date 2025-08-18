Pinpoint — iOS Travel App (starter)
This archive includes:
- Xcode-ready Swift source files (place into an Xcode project target)
- Node.js backend stub with runnable mocks (Express)
- Figma JSON spec (designer-friendly)
- Sign in with Apple SwiftUI implementation wired to FirebaseAuthService (sample)

How to use
1) iOS app:
   - Create a new iOS app in Xcode (iOS 16+, Swift 5.8). Add these Swift files into your target.
   - Add GoogleService-Info.plist from your Firebase project into Resources/.
   - Add Firebase via Swift Package Manager (FirebaseAuth, FirebaseCore).
   - Build & run on device or simulator.

2) Node backend:
   - Install Node 18+ and run:
       cd backend
       npm install
       npm start
   - Server runs on http://localhost:3000 and exposes /places and /itineraries endpoints with mock data.

3) Figma JSON:
   - The figma_mock.json file contains frames and assets metadata for designers. It's not an official .fig file but a structured spec to import or reproduce in Figma.

Files in this archive:
- ios/ (Swift files)
- backend/ (Node.js server)
- figma/figma_mock.json

