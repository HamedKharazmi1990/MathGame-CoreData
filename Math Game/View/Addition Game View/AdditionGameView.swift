//
//  AdditionGameView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct AdditionGameView: View {
    @State private var gameVM = AdditionGameViewModel()
    
    var body: some View {
        ZStack {
            GameBackgroundView()
            
            VStack {
                ScoreLivesView(
                    score: gameVM.score,
                    lives: gameVM.gameModel.lives,
                    maxLives: 3,
                    level: gameVM.gameModel.level
                )
                
                Spacer()
            }
        }
    }
}

#Preview {
    AdditionGameView()
}
