//
//  MusicModel.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 27/03/2025.
//

import SwiftUI

struct MusicModel: Hashable {
    let name: String
    let artist: [String]
    let image:String
    let monthlyListeners: String
    let duration:Double
    let video:Video
    let hightlightedLyric:String
    let remainingLyric:String
    let color:Color
    let descImage:String
    var desc:String = ""
}

let songs : [MusicModel] = [
    MusicModel(name: "Pure Cocaine", artist: ["Lil Baby"], image: "rapcaviar",  monthlyListeners: "30.9M", duration: 237.0, video: .init(id: "music"), hightlightedLyric: "From the streeets, but I got a little sense \n But I had to go coupe, no brain (Coupe, no brain)", remainingLyric: "Ain't worried `bout you, I`ma do what I do \n And do my thing (Do my thing)", color: Color(hex:0xA9A9A9), descImage: "lilbaby", desc : "Some artists define a genre, but Lil Baby defines a generation. The GRAMMY Award-Wining rapper has smashed records, made history, and impacted the course of modern hip-hop.")
]

let  miniPlayerSong : MusicModel =
MusicModel(name: "Jowo", artist: ["Winyo, Fancy Fingers"], image: "jowo", monthlyListeners: "57.2k", duration: 230.0, video: .init(id: ""), hightlightedLyric: "", remainingLyric: "", color: .blue, descImage: "jowo")
    


struct Video: Hashable {
    let id: String
}
