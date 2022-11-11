//
//  SoccerTeamViewModel.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import Foundation

class SoccerTeamViewModel: ObservableObject {
	@Published public var soccerTeams = [Team]()

	func getSoccerTeam(leagueID: String) async throws {
		do {
			let team = try await TeamApi.fetchSoccerTeam(leagueID)
			DispatchQueue.main.async {
				self.soccerTeams = team.teams
			}
		} catch {
			throw error
		}
	}
}
