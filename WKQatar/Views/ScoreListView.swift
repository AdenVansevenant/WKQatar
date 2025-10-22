import SwiftUI

struct ScoreListView: View {
    var matches: [WKResult]
    @Binding var selectedMatch: WKResult?
    var favoriteTeam: String

    var body: some View {
        List {
            ForEach(matches, id: \.self) { match in
                VStack(spacing: 4) {
                    // Eerste regel: teamnamen
                    HStack {
                        Text(match.homeTeam)
                            .foregroundColor(match.homeTeam == favoriteTeam ? .red : .primary)
                            .frame(maxWidth: .infinity, alignment: .trailing)

                        Text("X")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Text(match.awayTeam)
                            .foregroundColor(match.awayTeam == favoriteTeam ? .red : .primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    // Tweede regel: scores
                    HStack {
                        Text("\(match.homeTeamScore ?? 0)")
                            .frame(maxWidth: .infinity, alignment: .trailing)

                        Text("-")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Text("\(match.awayTeamScore ?? 0)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.vertical, 6)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedMatch = match
                }
            }
        }
        .navigationTitle("Wedstrijden")
    }
}
