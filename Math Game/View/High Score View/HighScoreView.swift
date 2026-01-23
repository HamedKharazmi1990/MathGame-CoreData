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
                    ForEach(Array(highScoreVM.highScores.enumerated()), id: \.offset) { index, entity in
                        RankScoreView(
                            rank: index + 1,
                            score: Int(entity.score),
                            entity: entity
                        )
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

struct RankScoreView: View {
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    var color: Color {
        scoreColors[(rank - 1) % scoreColors.count]
    }
    let scoreColors: [Color] = [
        .blue, .pink, .purple, .yellow, .orange
    ]
    @State private var editMode = false
    
    @Environment(HighScoreViewModel.self) private var highScoreVM
    
    @State private var name: String = ""
    @State private var save = false
    
    var body: some View {
        VStack {
            if editMode {
                HStack {
                    TextField(entity.name ?? "Name", text: $name)
                        .padding()
                        .background(Color.green.gradient)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                    
                    Button {
                        highScoreVM.updateHighScore(
                            entity: entity,
                            name: name.isEmpty ? (entity.name ?? "Anon") : name)
                        withAnimation {
                            editMode.toggle()
                        }
                    } label: {
                        Text("Save")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.red.gradient)
                            .cornerRadius(10)
                    }

                }
            } else {
                Text("Display score data")
                    .onTapGesture {
                        withAnimation {
                            editMode.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    HighScoreView()
        .environment(HighScoreViewModel())
}
