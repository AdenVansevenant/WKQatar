import SwiftUI

struct ListStadionView: View {
    @Environment(WKDataStore.self) var store
    let favoriteTeam: String

    @State private var selectedLocation: String?
    @State private var selectedMatch: WKResult?

    var body: some View {
        NavigationSplitView {
            List(store.getAllLocations(), id: \.self, selection: $selectedLocation) { location in
                Text(location)
            }
            .navigationTitle("Stadions")
        } content: {
            if let loc = selectedLocation {
                ScoreListView(
                    matches: store.getMatches(for: loc),
                    selectedMatch: $selectedMatch,
                    favoriteTeam: favoriteTeam
                )
            } else {
                Text("Selecteer een stadion")
            }
        } detail: {
            if let match = selectedMatch {
                DetailGameView(match: match, favoriteTeam: favoriteTeam)
            } else {
                Text("Selecteer een wedstrijd")
            }
        }
    }
}

#Preview {
    ListStadionView(favoriteTeam: "Nederland")
}
