//
//  HighScoreTitle.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 23.01.26.
//

import SwiftUI

struct HighScoreTitle: View {
    var body: some View {
        HStack {
            VTextImage(
                imageName: "creature0",
                text: "Rank",
                dim: 25
            )
            VTextImage(
                imageName: "creature1",
                text: "Score",
                dim: 25
            )
            VTextImage(
                imageName: "creature2",
                text: "Name",
                dim: 25
            )
        }.padding(.horizontal)
    }
}

#Preview {
    HighScoreTitle()
}
