import SwiftUI

@main
struct WKQatarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(WKDataStore())
        }
    }
}
