//
//  VideoPlayerViewModel.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import AVKit
import Combine

@MainActor
class VideoPlayerViewModel: ObservableObject {
    @Published var player = AVPlayer()
    @Published var isPlaying: Bool = false
    
    private var cancellables =  Set<AnyCancellable>()
    
    let video:Video
    
    init(video: Video){
        self.video = video
        loadVideoFile()
    }
    
    func loadVideoFile(){
        let fileTypes = ["mov", "mp4"]
        
        guard let bundleId = Bundle.main.path(forResource: video.id, ofType: "mp4") else {return}
        let videoUrl = URL(fileURLWithPath: bundleId)
        let playerItem = AVPlayerItem(url: videoUrl)
        player.replaceCurrentItem(with: playerItem)
        player.isMuted = true
    }
    
    func play(){
        player.play()
        player.isMuted = true
        isPlaying = true
    }
    
    func pause(){
        player.pause()
        isPlaying = false
    }
    
    func setLoop(){
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem,queue: .main){[weak self] _ in
            Task {@MainActor in
                self?.player.seek(to: .zero)
                self?.player.play()
            }
        }
    }
}
