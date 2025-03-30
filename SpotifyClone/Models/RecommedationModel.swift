//
//  RecommedationModel.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import Foundation
import SwiftUI

struct RecommedationModel:Identifiable {
    let id = UUID()
    let title:String
    var description:String = ""
    var image:String = ""
    var color : Color? = nil
}

let topRecommedations:[RecommedationModel] = [
    RecommedationModel(title: "Discover Weekly",image: "discover"),
    RecommedationModel(title: "New Music Friday Kenya",image:"new"),
    RecommedationModel(title: "Reggae Mix",image:"reggea"),
    RecommedationModel(title: "Release Radar",image:"release"),
    RecommedationModel(title: "RapCaviar",image:"rapcaviar"),
    RecommedationModel(title: "Chill Travel Mix",image:"chill"),
    RecommedationModel(title: "Liked Songs",image:"liked"),
    RecommedationModel(title: "Hardcore Hip Hop Mix",image:"hiphop"),
]

let topMixes: [RecommedationModel] = [
    RecommedationModel(title: "Drake Mix",description: "Central Cee, The Weeknd and latto", image:"drake",color: .pink),
    RecommedationModel(title: "2010's Mix",description: "XXXTENTACACION, Future, J Cole and more", image:"xxtentacion",color: .yellow),
    RecommedationModel(title: "Lil Baby",description: "Tory lanez, Lil baby, Gunna, Chris, Quavo and more", image:"lilbaby",color: .orange),
]
