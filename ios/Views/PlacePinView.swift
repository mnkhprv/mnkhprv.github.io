import SwiftUI

struct PlacePinView: View {
    var place: Place
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .shadow(radius: 2)
            Text(place.name)
                .font(.caption2)
                .fixedSize()
        }
    }
}
