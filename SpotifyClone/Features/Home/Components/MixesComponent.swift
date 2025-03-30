//
//  MixesComponent.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI

struct MixesComponent: View {
    let option:RecommedationModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: spacing.bigSmall){
            ZStack(alignment: .bottomLeading){
                Image(option.image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .cornerRadius(5)
                    .frame(width: 165 , height: 170)
                HStack{
                    if let color = option.color {
                        Rectangle()
                            .foregroundStyle(color)
                            .frame(width: 5,height: 15)
                    }
                    TitleLarge(text: option.title,fontSize: 20)
                        .lineLimit(2).padding(.horizontal, spacing.small)
                }.padding(.bottom,spacing.bigSmall)
                
                VStack{
                   
                    
                    if let color = option.color {
                        Rectangle()
                            .foregroundStyle(color)
                            .frame(height: 5)
                    }
            
                }
            }.overlay(
                Image("spotify" )
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .padding(6),
                alignment: .topLeading
            )
            
            BodyMediumText(text: option.description,fontSize: 13)
                .lineLimit(2)
        
        }
        .frame(width: 165)
        .background(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(Theme.background))
    }
}

#Preview {
    MixesComponent(option: topMixes[0])
}
