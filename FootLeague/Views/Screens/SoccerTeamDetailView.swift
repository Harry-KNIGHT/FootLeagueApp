//
//  SoccerTeamDetailView.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import SwiftUI

struct SoccerTeamDetailView: View {
	let team: Team
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .leading, spacing: 10) {
				if let bannerImage = team.strTeamBanner {
					TeamAsyncImageView(team: team, image: bannerImage, width: .infinity, height: 80)
				}
				Group {
					Text(team.strCountry ?? "")
					Text(team.strLeague ?? "")
						.font(.title2)
						.fontWeight(.heavy)
					Text(team.strDescriptionEN ?? "")

					Text(team.strStadiumDescription ?? "")
						.padding(.top)
				}
				.padding(.horizontal, 15)
			}


		}
		.navigationTitle(team.strTeam ?? "")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct SoccerTeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			SoccerTeamDetailView(team: .sample)
		}
    }
}
