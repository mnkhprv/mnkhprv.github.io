import SwiftUI

struct PlaceDetailView: View {
    let place: Place
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(place.name).font(.title2).bold()
            if let addr = place.address { Text(addr).font(.subheadline) }
            if let phone = place.phone { Text(phone).font(.subheadline) }
            Spacer()
        }
        .padding()
    }
}
