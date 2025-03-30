//
//  PlayerViewModel.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import Foundation
import UIKit

@MainActor
class PlayerViewModel: ObservableObject {
    
    @Published var value : Double = 0.0
    @Published var totalDuration: Double = 251.0
    @Published var isPlaying: Bool = true
    @Published var timer: Timer?
    
    @Published var currentVideo: Video = .init(id: "music")
    @Published var currentSong: MusicModel = songs.first!
    
    @Published private var currentSongIndex: Int = 0
    
    @Published var videos: [Video] = [
        .init(id: "music")
    ]
    
    func startTimer() {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ [weak self] _ in
            guard let self = self else { return }
            Task { @MainActor in
                if self.isPlaying, self.value < self.totalDuration {
                    self.value += 1
                }else{
                    self.stopTimer()
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func nextSong(){
        if currentSongIndex < songs.count - 1 {
            currentSongIndex += 1
            updateCurrentSongAndVideo()
        }
    }
    
    func previousSong(){
        if currentSongIndex > 0 {
            currentSongIndex -= 1
            updateCurrentSongAndVideo()
        }
    }
    
    func updateCurrentSongAndVideo(){
        let newSong = songs[currentSongIndex]
        currentSong = newSong
        currentVideo = newSong.video
    }
    
    func timeformat(_ time: Double)->String {
        let minutes  = Int(time) / 60
        let seconds  = Int(time) % 60
        return String(format: "%d:%02d", minutes,seconds)
    }
    
    func getDeviceName() -> String{
        return UIDevice.current.name
    }
}
