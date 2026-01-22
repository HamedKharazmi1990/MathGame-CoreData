//
//  HighScoreViewModel.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import Foundation
import CoreData
import Observation

@Observable
class HighScoreViewModel {
    let container: NSPersistentContainer
    
    var highScores: [HighScoreEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "HighScoresDataModel")
        
        // Load the data
        container
            .loadPersistentStores { description, error in
                if let error {
                    print("Loading error: \(error.localizedDescription)")
                } else {
                    print("LOADING SUCCESSFUL")
                }
            }
        
        // Fetch data into highScores
        fetchHighScores()
    }
    
    func fetchHighScores() {
        let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
        
        do {
            highScores = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
    
}
