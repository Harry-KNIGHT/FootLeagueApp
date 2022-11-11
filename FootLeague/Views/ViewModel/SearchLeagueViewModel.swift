//
//  SearchLeagueViewModel.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import Foundation
enum ApiError: Error {
	case outOfBounds, urlNotFound, somethingWentWrong
}
class SearchLeagueViewModel: ObservableObject {
	@Published public var leagues = [League]()

	func getLeague() async throws {
		let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php")
		guard let url = url else {  throw ApiError.urlNotFound }

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ApiError.outOfBounds}

		do {
			let leaguesResponse = try JSONDecoder().decode(LeagueResponse.self, from: data)
			DispatchQueue.main.async {
				self.leagues = leaguesResponse.leagues
			}
		} catch {
			throw error
		}
	}
	func searchResult(searchLeague: String) -> [League] {
		if searchLeague.isEmpty {
			return leagues
		} else {
			return self.leagues.filter { $0.strLeague!.contains(searchLeague) }
		}
	}

	
}
