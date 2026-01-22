//
//  ContentView.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 22.01.26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Text("Addition Game View")
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            Text("High Score View")
                .tabItem {
                    Image(systemName: "list.number")
                    Text("High Scores")
                }
        }
    }
}

#Preview {
    MainView()
}
