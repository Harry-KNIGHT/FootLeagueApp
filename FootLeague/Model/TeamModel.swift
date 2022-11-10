//
//  TeamModel.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import Foundation

// MARK: - Team
struct TeamResponse: Codable {
	let teams: [Team]
}

struct Team: Codable {
	let idTeam, idSoccerXML, idAPIfootball: String?
	let intLoved: String?
	let strTeam: String?
	let strTeamShort: String?
	let strAlternate, strSport, strLeague, idLeague: String?
	let strLeague2, idLeague2, strLeague3: String?
	let idLeague3: String?
	let strLeague4: String?
	let idLeague4: String?
	let strLeague5: String?
	let idLeague5: String?
	let strLeague6: String?
	let idLeague6: String?
	let strLeague7: String?
	let idLeague7: String?
	let strKeywords, strStadiumDescription, strDescriptionEN, strStadiumLocation, strCountry: String?
	let strTeamBadge: String?
	let strTeamBanner: String?
}
