import SwiftUI

struct ScoreListView: View {
    var matches: [WKResult]
    @Binding var selectedMatch: WKResult?
    var favoriteTeam: String

    var body: some View {
        List(matches, id: \.self, selection: $selectedMatch) { match in
            VStack(alignment: .leading) {
                Text("\(match.homeTeam) vs \(match.awayTeam)")
                    .foregroundColor(
                        match.homeTeam == favoriteTeam || match.awayTeam == favoriteTeam
                        ? .red : .primary
                    )
                Text(match.dateUTC)
                    .font(.caption)
            }
        }
        .navigationTitle("Wedstrijden")
    }
}
