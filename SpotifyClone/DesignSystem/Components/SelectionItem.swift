//
//  OptionItem.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI

struct SelectionItem: View {
    var isSelected:Bool = true
    var onClick:() -> Void = {}
    var text:String = ""
    
    var body: some View {
        
        HStack(alignment: .center){
            BodyMediumText(text: text,fontSize: 14, textColor: isSelected ? .black : Theme.onBackground)
                .padding(EdgeInsets(top: spacing.small, leading: Spacing.bigSmall, bottom: spacing.small, trailing: spacing.bigSmall))
        }  .background(
            RoundedRectangle(cornerRadius: 100, style: .continuous)
                .fill(isSelected ? Theme.primaryColor : .gray.opacity(0.3))
                .onTapGesture {
                    onClick()
                }
            
        )
       
    }
}

struct TopOptionsItem : View {
    
    var body: some View {
            HStack(spacing:spacing.small){
                Image("sza")
                    .resizable()
                    .cornerRadius(100)
                    .frame(width: 45 , height: 45)
                Spacer().frame(width: spacing.none)
                ForEach(homeOptions) { option in
                    SelectionItem(isSelected: option.id == homeOptions.first?.id, text: option.name)
                }
            
        }
    }
    
}

#Preview {
    
    TopOptionsItem()
    
//    VStack(alignment:.leading){
//        VerticalSpacer(size: .large)
//        VerticalSpacer(size: .large)
//        TopOptionsItem()
//        Spacer()
//    }.frame(height:.infinity)
//        .padding(spacing.extraMedium)
//        .background{
//            LinearGradient(colors: [
////                .clear,
////                .clear.opacity(0.5),
//                Theme.background.opacity(0.6),
//                Theme.background.opacity(0.6),
//                Theme.background.opacity(0.8),
//                Theme.background.opacity(0.9),
//            ],startPoint: .top,endPoint: .bottom)
//        }.ignoresSafeArea()
}
