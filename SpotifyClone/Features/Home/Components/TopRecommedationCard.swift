//
//  TopRecommedationCard.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI

struct TopRecommedationCard: View {
    let option:RecommedationModel
    
    var body: some View {
        HStack(alignment: .center,spacing: spacing.bigSmall){
            Image(option.image)
                .resizable()
                .cornerRadius(3)
                .frame(width: 60 , height: 60)
            TitleLarge(text: option.title,fontSize: 14)
                .lineLimit(2)
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 3, style: .continuous)
                .fill(.gray.opacity(0.25)))
    }
}

#Preview {
    TopRecommedationCard(option: topRecommedations[0])
}
