//
//  FootLeagueApp.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import SwiftUI

@main
struct FootLeagueApp: App {
	@StateObject var leagueVM = SearchLeagueViewModel()
	@StateObject var soccerTeamVM = SoccerTeamViewModel()
    var body: some Scene {
        WindowGroup {
            SearchLeagueView()
				.environmentObject(leagueVM)
				.environmentObject(soccerTeamVM)
        }
    }
}
