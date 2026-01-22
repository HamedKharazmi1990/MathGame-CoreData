//
//  OptionsView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct OptionsView: View {
    let gameVM: AdditionGameViewModel
    
    let columns = [
        GridItem( .flexible()),
        GridItem( .flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(gameVM.possibleSolutions, id: \.self) { option in
                let cheatColor: Color = option == gameVM.answer ? .red : .black
                
                BubbleView(
                    textColor: cheatColor,
                    bgColor: .purple.opacity(0.7),
                    name: "bubble2",
                    text: ("\(option)")
                )
                .onTapGesture {
                    withAnimation {
                        if gameVM.answer == option {
                            gameVM.increseScore()
                        } else {
                            gameVM.loseLife()
                        }
                        gameVM.generateNumbers()
                    }
                }
            }
        }
    }
}

#Preview {
    OptionsView(gameVM: AdditionGameViewModel())
}
