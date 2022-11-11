//
//  TeamApi.swift
//  FootLeague
//
//  Created by Elliot Knight on 11/11/2022.
//

import Foundation

struct TeamApi {
	public static func fetchSoccerTeam(_ leagueID: String) async throws -> TeamResponse {
		let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/lookup_all_teams.php?id=\(leagueID)")

		guard let url = url else { throw ApiError.urlNotFound }

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw ApiError.outOfBounds
		}

		do {
			return try JSONDecoder().decode(TeamResponse.self, from: data)
		} catch {
			throw error
		}
	}
}
