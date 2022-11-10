//
//  SoccerTeamViewModel.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import Foundation

class SoccerTeamViewModel: ObservableObject {
	@Published public var soccerTeams = [Team]()

	func getSoccerTeam() async throws {
		let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/search_all_teams.php?l=French%20Ligue%201")

		guard let url = url else { return }

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw ApiError.outOfBounds
		}

		do {
			let teams = try JSONDecoder().decode(TeamResponse.self, from: data)
			DispatchQueue.main.async {
				self.soccerTeams = teams.teams
			}
		} catch {
			throw error
		}
	}
}
