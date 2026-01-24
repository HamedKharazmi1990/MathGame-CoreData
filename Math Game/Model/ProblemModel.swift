//
//  ProblemModel.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import Foundation

struct ProblemModel: Identifiable {
    let id = UUID()
    let number1: Int
    let number2: Int
    let level: Int
    
    // solutions[0] is the answer
    // the other elements are distractions.
    let solutions: [Int]
    
    var answer: Int {
        solutions[0]
    }
    
    func checkSolution(value: Int) -> Bool {
        !solutions.isEmpty && value == answer
    }
    
    init(level: Int) {
        self.level = level
        let lower = level * 5
        let upper = (level + 1) * 5
        self.number1 = Int.random(in: lower...upper)
        self.number2 = Int.random(in: lower...upper)
        let answer = number1 + number2
        
        var newSolutions: [Int] = []
        newSolutions.append(answer) // True solution at solutions[0] = 27
        newSolutions.append(answer + 10) // solutions[1] Distraction 37
        let belowAnswer = answer - 5
        let aboveAnswer = answer + 5
        newSolutions.append(Int.random(in: answer+1...aboveAnswer)) // solutions[2]
        newSolutions.append(Int.random(in: belowAnswer..<answer)) // solutions[3]
        self.solutions = newSolutions
    }
}
