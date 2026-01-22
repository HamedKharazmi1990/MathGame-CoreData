//
//  HighScoreView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct HighScoreView: View {
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            
            Text("HighScoreView")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    HighScoreView()
}
