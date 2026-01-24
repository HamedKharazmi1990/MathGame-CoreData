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
                SelectButton(option: option, gameVM: gameVM)
            }
        }
    }
}

struct SelectButton: View {
    let option: Int
    @State var selectedOption: Int? = nil
    let gameVM: AdditionGameViewModel
    
    var isSelected: Bool {
        selectedOption == option
    }
    
    var scale: CGFloat {
        isSelected ? 1.2 : 1
    }
    
    var color: Color {
        isSelected ? getRandomColor() : .purple.opacity(0.7)
    }
    
    func getRandomColor() -> Color {
        [.green.opacity(0.7),
         .red,
         .blue.opacity(0.5)]
            .randomElement() ?? .green.opacity(0.7)
    }
    var body: some View {
        // Use it in debug mode and apply it to BuubleView(textColor: cheatColor)
//                let cheatColor: Color = option == gameVM.answer ? .red : .black
        
        BubbleView(
            textColor: .black,
            bgColor: color,
            name: "bubble2",
            text: ("\(option)")
        )
        .scaleEffect(scale)
        .onTapGesture {
            withAnimation(
                .spring(response: 0.5, dampingFraction: 0.3)
                .repeatCount(1, autoreverses: true)
            ) {
                selectedOption = option
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    selectedOption = nil
                }
            }
            
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

#Preview {
    OptionsView(gameVM: AdditionGameViewModel())
}
