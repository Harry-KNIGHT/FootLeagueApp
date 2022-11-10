//
//  SoccerTeamListView.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import SwiftUI

struct SoccerTeamListView: View {

	let columns = [
	 GridItem(.flexible()),
	 GridItem(.flexible()),
	]

    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(teams) { team in
						if let badge = team.strTeamBadge {
							NavigationLink(destination: SoccerTeamDetailView(team: team)) {
								TeamAsyncImageView(team: team, image: badge)
							}
						}
					}
				}
			}
		}
    }
}

struct SoccerTeamListView_Previews: PreviewProvider {
    static var previews: some View {
        SoccerTeamListView()
    }
}
