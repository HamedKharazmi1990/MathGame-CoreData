//
//  HighScoreView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct HighScoreView: View {
    
    @Environment(HighScoreViewModel.self) private var highScoreVM
    
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            
            VStack {
                HighScoreTitle()
                
                List {
                    ForEach(highScoreVM.highScores) { entity in
                        Text("\(entity.score)")
                    }
                }
                
                Image("creature0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    HighScoreView()
        .environment(HighScoreViewModel())
}
