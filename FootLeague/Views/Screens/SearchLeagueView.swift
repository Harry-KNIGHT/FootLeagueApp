//
//  SearchLeagueView.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import SwiftUI

struct SearchLeagueView: View {
	@State private var searchLeague: String = ""
    var body: some View {
		NavigationStack {
			Text("\(searchLeague)")
				.searchable(text: $searchLeague)
		}
    }
}

struct SearchLeagueView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLeagueView()
    }
}
