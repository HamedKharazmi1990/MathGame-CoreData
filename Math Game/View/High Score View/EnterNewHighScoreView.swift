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
    @Environment(HighScoreViewModel.self) private var highScoreVM
    
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
                    name = name.isEmpty ? "Anon" : name
                    highScoreVM.addHighScore(
                        name: name,
                        score: Int64(score)
                    )
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
}

#Preview {
    EnterNewHighScoreView(
        score: 123,
        name: .constant(""),
        isPresented: .constant(true)
    )
        .environment(HighScoreViewModel())
}
