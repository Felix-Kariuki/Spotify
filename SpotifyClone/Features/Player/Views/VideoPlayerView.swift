//
//  VideoPlayerView.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @StateObject private var viewModel:VideoPlayerViewModel
    @Binding var currentVideo:Video
    var size:CGSize
    
    
    init(video: Video, currentVideo: Binding<Video>, size: CGSize) {
            _viewModel = StateObject(wrappedValue: VideoPlayerViewModel(video: video))
            self._currentVideo = currentVideo
            self.size = size
        }
    
    var body: some View {
          VideoPlayerUIView(player: viewModel.player, size: size)
              .onAppear {
                  if currentVideo == viewModel.video {
                      DispatchQueue.main.async {
                          viewModel.play()
                          viewModel.setLoop()
                      }
                  }
              }
              .onChange(of: currentVideo) { _, newVideo in
                  if newVideo == viewModel.video {
                      DispatchQueue.main.async {
                          viewModel.play()
                      }
                  } else {
                      viewModel.pause()
                  }
              }
              .ignoresSafeArea()
      }
}

struct VideoPlayerUIView: UIViewControllerRepresentable {
    var player: AVPlayer
    var size: CGSize
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        controller.view.layer.addSublayer(playerLayer)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
