import SwiftUI

struct ScoreDetailView: View {
    let homeTeam: String
    let awayTeam: String
    let homeScore: Int?
    let awayScore: Int?

    var body: some View {
        Grid {
            GridRow {
                Text(homeTeam)
                Text("X")
                Text(awayTeam)
            }
            GridRow {
                Text("\(homeScore ?? 0)")
                Text("-")
                Text("\(awayScore ?? 0)")
            }
        }
        .font(.title2)
        .padding()
    }
}
