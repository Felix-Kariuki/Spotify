//
//  PlayerView.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI

struct MusicPlayerView: View {
    
    @StateObject private var viewModel = PlayerViewModel()
    var size: CGSize
    var safeArea: EdgeInsets
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    var body: some View {
        VStack{
            ZStack {
                ScrollView {
                    VStack{
                        BackgroundVideoView()
                            .overlay(alignment:.bottom){
                                VStack {
                                    songNameItem
                                    songSlider
                                    controls
                                }.frame(height:300)
                                    .padding(spacing.extraMedium)
                                    .background{
                                        LinearGradient(colors: [
                                            .clear,
                                            .clear.opacity(0.5),
                                            .black.opacity(0.6),
                                            .black.opacity(0.8),
                                            .black.opacity(0.9),
                                            .black
                                        ],startPoint: .top,endPoint: .bottom)
                                    }
                            }
                        VStack(spacing:spacing.extraMedium){
                            lyricsItem
                            aboutArtistView
                        
                        }.padding(12)
                    }.overlay{
                        TopPlayer()
                    }
                }
                .scrollIndicators(.hidden)
                .coordinateSpace(name: "player")
                .safeAreaPadding(EdgeInsets(top: 0, leading: 0, bottom: safeArea.bottom + 100, trailing: 0))
            }
            .ignoresSafeArea()
        }
        .onAppear{
            viewModel.startTimer()
        }
        .onDisappear{
            viewModel.stopTimer()
        }
        .onChange(of: viewModel.isPlaying) {_,playing in
            playing ? viewModel.startTimer() : viewModel.stopTimer()
        }
        .onChange(of: viewModel.currentVideo){oldValue,newValue in
            if let currentSong = songs.first(where: {$0.video.id == newValue.id}){
                viewModel.currentSong = currentSong
                viewModel.value = 0.0
            }
            
        }
    }
    
    @ViewBuilder
    func TopPlayer() -> some View {
        let height = size.height * 0.25
        GeometryReader {proxy in
            let minY = proxy.frame(in: .named("player")).minY
            let progress = (minY / (height * 2.6 * -1))
            
            ZStack{
                VStack(alignment: .leading){
                    Spacer()
                    HStack{
                        ScrollView(.horizontal) {
                            HStack{
                                TitleLarge(text: "\(viewModel.currentSong.name) •",fontSize: 22)
                                HStack{
                                    ForEach(viewModel.currentSong.artist, id:\.self){ artist in
                                        TitleMedium(text: artist != viewModel.currentSong.artist.last ? "\(artist),": artist,fontSize: 14,textColor: .gray)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack(spacing:24) {
                            Image(.tick)
                                .resizable()
                                .frame(width: 24,height: 24)
                            Image(systemName: "pause.fill")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                        .padding(.horizontal,14)
                    }
                    
                    HStack(spacing:4) {
                        Image(systemName: "speaker.wave.2.circle")
                            .font(.subheadline)
                            .foregroundStyle(.green)
                        BodyMediumText(text: viewModel.getDeviceName(),fontSize: 12,textColor: Theme.primaryColor)
                    }
                    .padding(.horizontal)
                    Rectangle().fill(.white.opacity(0.5))
                        .frame(height: 2)
                        .overlay(alignment: .leading) {
                            Rectangle().fill(.white)
                                .frame(width: 200,height: 2)
                        }
                }
                .frame(height: 130)
                .background(.regularMaterial)
                .opacity(progress > 1 ? 1 : 0)
            }
            .frame(maxWidth: .infinity)
            .offset(y: -minY - 5)
        }
    }
    
    @ViewBuilder
    func BackgroundVideoView() -> some View {
        let height = size.height
        GeometryReader { g in
            let size = g.size
            TabView(selection: $viewModel.currentVideo) {
                ForEach(viewModel.videos, id: \.self) { video in
                    VideoPlayerView(
                        video: video,
                        currentVideo: $viewModel.currentVideo,
                        size: size
                    )
                    .tag(video)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .frame(height: height + safeArea.top)
    }
    
}

private extension MusicPlayerView {
    var controls:some View{
        VStack {
            HStack(spacing:54){
                Image(.shuffle)
                HStack(spacing:spacing.extraMedium){
                    Button{
                        viewModel.previousSong()
                    } label: {
                        Image(.previous)
                    }
                    
                    Button{
                        viewModel.isPlaying.toggle()
                    } label: {
                        Circle()
                            .fill(.white)
                            .overlay(content: {
                                Image(viewModel.isPlaying ? .pause : .play)
                            })
                        
                    }
                    
                    
                    Button{
                        viewModel.nextSong()
                    } label: {
                        Image(.next)
                    }
                }
                Image(.repeat)
            }
            HStack{
                Image(.connect)
                    .resizable()
                    .frame(width: 24,height: 24)
                Spacer()
                Image(.share)
                    .resizable()
                    .frame(width: 24,height: 24)
                    .padding(.trailing)
                Image(.queue)
                    .resizable()
                    .frame(width: 24,height: 24)
            }
        }
    }
}

private extension MusicPlayerView {
    var songSlider:some View{
        VStack {
            Slider(value: $viewModel.value,in:0...viewModel.totalDuration)
                .tint(.white)
            HStack {
                BodyMediumText(text: viewModel.timeformat(viewModel.value),fontFamily: Fonts.urbanistSemiBold,fontSize: 15, textColor: .gray)
                Spacer()
                BodyMediumText(text: "-\(viewModel.timeformat(viewModel.totalDuration - viewModel.value))",fontFamily: Fonts.urbanistSemiBold, fontSize: 15, textColor: .gray)
                
            }
        }
    }
}

private extension MusicPlayerView{
    var songNameItem : some View {
        VStack(alignment: .leading){
            Label("SwitchToVideo",systemImage: "play.rectangle")
                .font(.custom(Fonts.urbanistBold, size: 14))
                .foregroundStyle(.white)
                .padding(10)
                .background(.black.opacity(0.6))
                .cornerRadius(18)
            
            HStack{
                Image(viewModel.currentSong.image)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 50,height: 50)
                VStack(alignment: .leading){
                    TitleLarge(text: viewModel.currentSong.name,fontSize: 28)
                    
                    HStack(spacing: 2){
                        ForEach(viewModel.currentSong.artist, id:\.self){ artist in
                            TitleMedium(text: artist != viewModel.currentSong.artist.last ? "\(artist),": artist,fontSize: 16,textColor: .gray)
                        }
                    }
                }
                Spacer()
                Image(.tick)
            }
            
        }
    }
}

private extension MusicPlayerView{
    var lyricsItem : some View {
        VStack {
            HStack {
                TitleLarge(text:"Lyrics",fontSize: 18)
        
                Spacer()
                Circle().fill(.regularMaterial)
                    .frame(width: 32)
                    .overlay {
                        Image(.share)
                            .resizable()
                            .frame(width: 16,height: 16)
                    }
                Circle().fill(.regularMaterial)
                    .frame(width: 32)
                    .overlay {
                        Image(.fullScreen)
                            .resizable()
                            .frame(width: 16,height: 16)
                    }
            }.padding([.horizontal,.top])
            VStack(alignment:.leading) {
                TitleLarge(text:viewModel.currentSong.hightlightedLyric,fontSize: 24)
            
                ZStack(alignment:.leading) {
                Text(viewModel.currentSong.remainingLyric)
                        .lineLimit(1)
                        .font(.custom(Fonts.urbanistExtraBold, size: 24))
                        .foregroundStyle(.black)
                    Rectangle().fill(
                        LinearGradient.init(colors: [
                            .clear,
                            .clear.opacity(0.4),
                            viewModel.currentSong.color.opacity(0.5),
                            viewModel.currentSong.color
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: 26)
                }
            }.padding()
            
        }
        .background(viewModel.currentSong.color)
        .cornerRadius(18)
    }
}

private extension MusicPlayerView{
    var aboutArtistView :some View {
        VStack {
            VStack {
                ZStack(alignment:.topLeading) {
                    Image(viewModel.currentSong.descImage)
                        .resizable()
                        .scaledToFill()
                    TitleLarge(text: "About the artist",fontSize: 16)
                        .padding()
                        .padding(.top,spacing.extraMedium)
                }.frame(height: 200)
                VStack {
                    HStack {
                        VStack(alignment:.leading) {
                            TitleLarge(text:viewModel.currentSong.artist.first ?? "Artis",fontSize: 22)
                                .font(.title2.bold())
                            BodyMediumText(text:"\(viewModel.currentSong.monthlyListeners) monthly listeners",fontFamily: Fonts.urbanistSemiBold, textColor: .secondary)
                            
                        }
                        Spacer()
                        TitleSmall(text: "Follow",fontSize: 13)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius:50)
                                    .strokeBorder(Color.white.opacity(0.3),lineWidth: 1)
                            }
                        
                    }
                    .padding()
                    
                    BodyMediumText(text: viewModel.currentSong.desc,fontFamily: Fonts.urbanistMedium, fontSize: 16, textColor: .secondary)
                        .padding(.horizontal,15)
                        .padding(.bottom)
            
                }.padding(.top)
            }
            
        }.background(Color.gray.opacity(0.2))
            .cornerRadius(18)
    }
}

#Preview {
    PlayerMainView()
}
