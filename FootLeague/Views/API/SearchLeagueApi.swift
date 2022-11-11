//
//  SearchLeagueApi.swift
//  FootLeague
//
//  Created by Elliot Knight on 11/11/2022.
//

import Foundation

struct SearchLeagueApi {
	public static func fetchLeague() async throws -> LeagueResponse {
		let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php")
		guard let url = url else {  throw ApiError.urlNotFound }

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ApiError.outOfBounds}

		do {
			return try JSONDecoder().decode(LeagueResponse.self, from: data)

		} catch {
			throw error
		}
	}
}
