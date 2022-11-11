//
//  SoccerTeamListView.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import SwiftUI

struct SoccerTeamListView: View {
	@EnvironmentObject var soccerTeamVM: SoccerTeamViewModel
	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible()),
	]
	let leagueId: String

	var body: some View {
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(soccerTeamVM.soccerTeams, id: \.idTeam) { team in
						if let badge = team.strTeamBadge {
							NavigationLink(destination: SoccerTeamDetailView(team: team)) {
								TeamAsyncImageView(team: team, image: badge)
							}
						}
					}
				}
				.task {
					do {
						try await soccerTeamVM.getSoccerTeam(leagueID: leagueId)
					} catch {
						print(error.localizedDescription)
					}
					print(soccerTeamVM.soccerTeams.count)
				}
			}
		}
	}
}

struct SoccerTeamListView_Previews: PreviewProvider {
	static var previews: some View {
		SoccerTeamListView(leagueId: "3459")
			.environmentObject(SoccerTeamViewModel())
	}
}
