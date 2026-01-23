//
//  VTextImage.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 23.01.26.
//

import SwiftUI

struct VTextImage: View {
    let imageName: String
    let text: LocalizedStringKey
    let dim: Double
    
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: dim, height: dim)
            
            Text(text)
                .fixedSize(horizontal: true, vertical: false)
                .font(.headline)
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VTextImage(
        imageName: "creature0",
        text: "Rank",
        dim: 50
    )
}
