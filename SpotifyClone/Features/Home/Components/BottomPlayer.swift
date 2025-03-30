//
//  BottomPlayer.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI
import Foundation

struct BottomPlayer: View {
    var onClick:()->Void={}
    var song:MusicModel = miniPlayerSong
    var body: some View {
        VStack{
            HStack(spacing:spacing.bigSmall){
                Image(song.albumImage)
                    .resizable()
                    .frame(width: 40,height: 40)
                    .cornerRadius(6)
                VStack(alignment: .leading,
                       spacing: 2){
                    BodyMediumText(text: "\(song.name)",fontSize: 15)
                    HStack{
                        ForEach(song.artist, id:\.self){ artist in
                            BodyMediumText(text: artist != song.artist.last ? "\(artist),": artist,fontSize: 12)
                        }
                    }
                }
                Spacer()
                
                HStack(spacing: spacing.extraMedium){
                    Image(.connect)
                        .resizable()
                        .frame(width: 20,height: 20)
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 15,height: 15)
                    
                }.padding(.trailing, spacing.small)
            
                
            }
            Rectangle().fill(.white.opacity(0.5))
                .frame(height: 2)
                .overlay(alignment: .leading) {
                    Rectangle().fill(.white)
                        .frame(width: 200,height: 2)
                }
        }
        .padding(EdgeInsets(top: spacing.small, leading: spacing.bigSmall, bottom: spacing.none, trailing: spacing.bigSmall))
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color(hex: 0x206982)))
        .onTapGesture {
            onClick()
        }
        
    }
}

#Preview {
    BottomPlayer()
}
