//
//  MainView.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
        
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical.fill")
                }
        }.accentColor(.white)
            .onAppear() {
                UITabBar.appearance().barTintColor = UIColor(.black.opacity(0.3))
                UITabBar.appearance().backgroundColor = UIColor(.black.opacity(0.3))
            }
            .overlay(
                BottomPlayer(onClick: {
                    navigationRouter.navigate(to: .playerview)
                })
                .padding(.bottom, 50)
                    .padding(.horizontal,10),
                alignment: .bottom
            )
        
    }
}

#Preview {
    MainView()
}
