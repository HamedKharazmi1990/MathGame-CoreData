//
//  HighScoreView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI
import SwiftData

struct HighScoreView: View {
    
    @Query private var highScores: [HighScoreEntity] = []
    
    var orderedHighScores: [HighScoreEntity] {
        highScores.sorted { $0.score > $1.score }
    }
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            
            VStack {
                HighScoreTitle()
                
                List {
                    ForEach(Array(orderedHighScores.enumerated()), id: \.offset) { index, entity in
                        RankScoreView(
                            rank: index + 1,
                            score: Int(entity.score),
                            entity: entity
                        )
                    }
                    .onDelete(perform: deleteScore)
                    .listRowBackground(Color.black)
                }.listStyle(.plain)
                
                Image("creature0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
    }
    
    func deleteScore(indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(highScores[index])
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
    
    @Query private var highScores: [HighScoreEntity] = []
    
    @Environment(\.modelContext) var modelContext
    
    @State private var name: String = ""
    @State private var save = false
    
    var body: some View {
        VStack {
            if editMode {
                HStack {
                    TextField(entity.name, text: $name)
                        .padding()
                        .background(Color.green.gradient)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                    
                    Button {
                        entity.name = name.isEmpty ? entity.name : name
                        do {
                            try modelContext.save()
                        } catch {
                            print("update/save failure")
                        }
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
                HStack {
                    Text(rank.ordinal)
                        .frame(maxWidth: .infinity)
                    Text("\(score)")
                        .frame(maxWidth: .infinity)
                    Text(entity.name.uppercased())
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(color)
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
        .modelContainer(for: HighScoreEntity.self)
}
