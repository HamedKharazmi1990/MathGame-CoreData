//
//  GameOverView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        HStack {
            Label {
                Text("Game Over")
                    .multilineTextAlignment(.center)
                Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
            } icon: {
                Image(Creatures.creature5.rawValue)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
                    .padding()
                    .background(Color.green)
                    .clipShape(Circle())
            }
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 3)
        }
    }
}

#Preview {
    GameOverView()
}
