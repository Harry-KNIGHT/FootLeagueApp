//
//  LeagueModel.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import Foundation

// MARK: - League
struct LeagueResponse: Codable {
	let leagues: [League]
}
struct League: Codable, Hashable {
	let idLeague, strLeague, strSport: String?
	let strLeagueAlternate: String?
}
