//
//  AdditionGameView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct AdditionGameView: View {
    @State private var gameVM = AdditionGameViewModel()
    
    @Environment(HighScoreViewModel.self) private var highScoreVM
    
    @State private var showHighScoreView = false
    
    var showHighScore: Bool {
        gameVM.gameOver && highScoreVM.isNewHighScore(score:gameVM.score)
    }
    
    @State private var name: String = ""
    
    // TODO: Update this once
    // we add the high score view model
    var showGameOverView: Bool {
        gameVM.gameOver
    }
    
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
                
                BubbleView(
                    textColor: .white,
                    bgColor: Color.purple.opacity(0.7),
                    name: "bubble3",
                    text: "\(gameVM.number1) + \(gameVM.number2)"
                )
                
                Spacer()
                
                OptionsView(gameVM: gameVM)
            }
            .padding()
            .blur(radius: showGameOverView ? 5 : 0)
            .disabled(showGameOverView)
            
            GameOverView()
                .padding()
                .blur(radius: showGameOverView ? 0 : 30)
                .opacity(showGameOverView ? 1 : 0)
                .disabled(!showGameOverView)
                .onTapGesture {
                    gameVM.reset()
                }
        }
        .fullScreenCover(
            isPresented: $showHighScoreView,
            onDismiss: {
                gameVM.reset()
            }) {
                EnterNewHighScoreView(
                    score: gameVM.score,
                    name: $name,
                    isPresented: $showHighScoreView
                )
            }
            .onChange(
                of: showHighScore) { oldValue, newValue in
                    showHighScoreView = newValue
                }
    }
}

#Preview {
    AdditionGameView()
        .environment(HighScoreViewModel())
}
