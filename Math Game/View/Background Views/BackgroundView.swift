//
//  BackgroundView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct BackgroundView: View {
    let colorList: [Color]
    let opacity: Double
    
    var body: some View {
        LinearGradient(
            colors: colorList,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(opacity)
        .ignoresSafeArea()
    }
}

struct GameBackgroundView: View {
    var body: some View {
        BackgroundView(
            colorList: [
                Color.purple,
                Color.pink,
                Color.clear
            ],
            opacity: 0.7
        )
    }
}

struct HighScoreBackgroundView: View {
    var body: some View {
        BackgroundView(
            colorList: [
                Color.black,
                Color.black,
                Color.gray
            ],
            opacity: 0.7
        )
    }
}

#Preview {
    GameBackgroundView()
    HighScoreBackgroundView()
}
