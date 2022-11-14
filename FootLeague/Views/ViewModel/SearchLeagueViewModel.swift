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
		do {
			let league = try await SearchLeagueApi.fetchLeague()
			DispatchQueue.main.async {
				self.leagues = league.leagues
			}
		} catch {
			throw error
		}
	}

	func searchResult(searchLeague: String) -> [League] {
		if searchLeague.isEmpty {
			return []
		} else {
			return self.leagues.filter { league in
				if let league = league.strLeague {
					return league.contains(searchLeague)
				}
				return false
			}
		}
	}
}
