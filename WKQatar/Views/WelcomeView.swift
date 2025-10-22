import SwiftUI

struct WelcomeView: View {
    @Environment(WKDataStore.self) var store
    @State var selectedTeam: String?

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
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
