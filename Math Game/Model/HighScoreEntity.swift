//
//  HighScoreEntity.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 24.01.26.
//

import Foundation
import SwiftData

@Model
class HighScoreEntity: Identifiable {
//    let id = UUID()
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
//    let score: Int
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
