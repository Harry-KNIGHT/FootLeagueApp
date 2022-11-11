//
//  SearchLeagueView.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import SwiftUI

struct SearchLeagueView: View {
	@State private var searchLeague: String = ""
	@EnvironmentObject var searchLeagueVM: SearchLeagueViewModel
    var body: some View {
		NavigationStack {
			List {
				ForEach(searchLeagueVM.searchResult(searchLeague: searchLeague), id: \.idLeague) { league in
					NavigationLink(destination: SoccerTeamListView(leagueId: league.idLeague ?? "")) {
						if let leagueNotNil = league.strLeague {
							Text(leagueNotNil)
						}
					}
				}
			}
			.searchable(text: $searchLeague) {
				ForEach(searchLeagueVM.searchResult(searchLeague: searchLeague), id: \.idLeague) { league in
					if let leagueExist = league.strLeague  {
						Text(leagueExist).searchCompletion(leagueExist)
					}
				}
			}
			.task {
				do {
					try await searchLeagueVM.getLeague()
				} catch {
					print("\(error.localizedDescription)")
				}
			}
		}
	}
}

struct SearchLeagueView_Previews: PreviewProvider {
	static var previews: some View {
		SearchLeagueView()
			.environmentObject(SearchLeagueViewModel())
	}
}
