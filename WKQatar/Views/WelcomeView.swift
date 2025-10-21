import SwiftUI

struct WelcomeView: View {
    @Environment(WKDataStore.self) var store
    @State private var selectedTeam: String?

    var body: some View {
        NavigationStack {
            VStack {
                Text("Kies je favoriete team")
                    .font(.title2)
                    .padding()

                List(store.getAllTeams(), id: \.self, selection: $selectedTeam) { team in
                    Text(team)
                        .foregroundColor(selectedTeam == team ? .red : .primary)
                }

                if let selectedTeam {
                    NavigationLink("Next") {
                        ListStadionView(favoriteTeam: selectedTeam)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            .navigationTitle("WK Qatar 2022")
        }
    }
}

#Preview {
    WelcomeView()
}
