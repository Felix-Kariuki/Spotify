//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 27/02/2025.
//

import SwiftUI
import TimberIOS

struct PlayerMainView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    var body: some View {
        GeometryReader { g in
            let safeArea = g.safeAreaInsets
            let size = g.size
            MusicPlayerView(
                size: size, safeArea:safeArea)
        }
    }
    

}

#Preview {
    PlayerMainView()
}
