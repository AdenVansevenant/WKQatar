//
//  WKDataStore.swift
//  WKQatar2022
//

import Foundation
import Observation

@Observable
class WKDataStore {
    var results: [WKResult] = []

    init() {
        results = load("WKResultsQatar.json")
    }

    func getAllTeams() -> [String] {
        let teams = results.flatMap { [$0.homeTeam, $0.awayTeam] }
        return Array(Set(teams)).sorted()
    }

    func getAllLocations() -> [String] {
        Array(Set(results.map { $0.location })).sorted()
    }

    func getMatches(for location: String) -> [WKResult] {
        results.filter { $0.location == location }
            .sorted { $0.dateUTC < $1.dateUTC }
    }
}
