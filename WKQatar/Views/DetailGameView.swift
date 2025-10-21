import SwiftUI

struct DetailGameView: View {
    let match: WKResult
    let favoriteTeam: String

    var body: some View {
        VStack(spacing: 16) {
            Text("Match \(match.matchNumber)")
                .font(.headline)

            ScoreDetailView(
                homeTeam: match.homeTeam,
                awayTeam: match.awayTeam,
                homeScore: match.homeTeamScore,
                awayScore: match.awayTeamScore
            )
            .foregroundColor(
                match.homeTeam == favoriteTeam || match.awayTeam == favoriteTeam
                    ? .red : .primary
            )

            VStack(alignment: .leading, spacing: 8) {
                Text("Datum: \(match.dateUTC)")
                Text("Locatie: \(match.location)")
                if let group = match.group {
                    Text("Groep: \(group)")
                }
            }
            .font(.subheadline)

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
