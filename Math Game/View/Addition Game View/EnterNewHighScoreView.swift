//
//  EnterNewHighScoreView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 23.01.26.
//

import SwiftUI

struct EnterNewHighScoreView: View {
    let score: Int
    @Binding var name: String
    @Binding var isPresented: Bool
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            BackgroundView(
                colorList: [.blue, .purple],
                opacity: 1
            )
            VStack {
                Text("New High Score!")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding()
                    
                Text("\(score)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                
                TextField("Enter your name", text: $name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                Button {
                    addHighScore()
                    isPresented = false
                } label: {
                    Text("Save")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }

                
            }
        }
    }
    
    func addHighScore() {
        name = name.isEmpty ? "Anon" : name
        modelContext.insert(
            HighScoreEntity(
                name: name,
                score: score
            )
        )
    }
}

#Preview {
    EnterNewHighScoreView(
        score: 123,
        name: .constant(""),
        isPresented: .constant(true)
    )
    .modelContainer(for: HighScoreEntity.self)
}
