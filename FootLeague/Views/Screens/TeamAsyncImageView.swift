//
//  TeamAsyncImageView.swift
//  FootLeague
//
//  Created by Elliot Knight on 10/11/2022.
//

import SwiftUI

struct TeamAsyncImageView: View {
	let team: Team
	var image: String = ""
	var width: CGFloat = 150
	var height: CGFloat = 150
	var body: some View {
		AsyncImage(url: URL(string: image), content: { image in
			image
				.resizable()
				.frame(width: width, height: height)
				.padding()

		}, placeholder: {
			ProgressView()
		})
	}
}

struct TeamAsyncImageView_Previews: PreviewProvider {
	static var previews: some View {
		TeamAsyncImageView(team: .sample)
	}
}
