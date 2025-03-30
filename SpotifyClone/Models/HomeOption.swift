//
//  HomeOption.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import Foundation

struct HomeOption: Identifiable {
    let id = UUID()
    let name: String
}

let homeOptions: [HomeOption] = [
    HomeOption(name: " All "),
    HomeOption(name: "Music"),
    HomeOption(name: "Podcasts")
]
