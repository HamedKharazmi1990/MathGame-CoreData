//
//  Math_GameApp.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI
import SwiftData

@main
struct Math_GameApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: HighScoreEntity.self)
        }
    }
}
