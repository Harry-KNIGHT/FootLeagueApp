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
			ScrollView {
			Text("\(searchLeague)")
				.searchable(text: $searchLeague)
				ForEach(searchLeagueVM.leagues, id: \.self) { league in
					Text(league.strLeagueAlternate ?? "")
					Text(league.strLeague ?? "")
					Text(league.strSport ?? "")
					Text(league.idLeague ?? "")
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
