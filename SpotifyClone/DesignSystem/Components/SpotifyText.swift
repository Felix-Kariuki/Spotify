//
//  SpotifyTest.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 27/03/2025.
//
import SwiftUI

struct SpotifyText: View {
    let text:String
    var fontFamily: String = Fonts.urbanistRegular
    var fontSize: CGFloat = 15
    var textColor: Color = Theme.onBackground
    var body: some View {
        
        Text(LocalizedStringKey(text))
            .foregroundColor(textColor)
            .font(.custom(fontFamily, size: fontSize))
    }
}


struct TitleLarge:View {
    let text:String
    var fontFamily: String = Fonts.urbanistExtraBold
    var fontSize: CGFloat = 24
    var textColor: Color = Theme.onBackground
    
    var body: some View {
        SpotifyText(
            text: text,
            fontFamily: fontFamily,
            fontSize: fontSize,
            textColor: textColor
        )
    }
}

struct TitleMedium:View {
    let text:String
    var fontFamily: String = Fonts.urbanistSemiBold
    var fontSize: CGFloat = 24
    var textColor: Color = Theme.onBackground
    
    var body: some View {
        SpotifyText(
            text: text,
            fontFamily: fontFamily,
            fontSize: fontSize,
            textColor: textColor
        )
    }
}

struct TitleSmall:View {
    let text:String
    var fontFamily: String = Fonts.urbanistBold
    var fontSize: CGFloat = 24
    var textColor: Color = Theme.onBackground
    
    var body: some View {
        SpotifyText(
            text: text,
            fontFamily: fontFamily,
            fontSize: fontSize,
            textColor: textColor
        )
    }
}


struct BodyMediumText:View {
    
    let text:String
    var fontFamily: String = Fonts.urbanistMedium
    var fontSize: CGFloat = 16
    var textColor: Color = Theme.onBackground
    
    var body: some View {
        SpotifyText(
            text: text,
            fontFamily: fontFamily,
            fontSize: fontSize,
            textColor: textColor
        )
    }
}


struct BodyLargeText:View {
    
    let text:String
    var fontFamily: String = Fonts.urbanistSemiBold
    var fontSize: CGFloat = 16
    var textColor: Color = Theme.onBackground
    
    var body: some View {
        SpotifyText(
            text: text,
            fontFamily: fontFamily,
            fontSize: fontSize,
            textColor: textColor
        )
    }
}

#Preview {
    Group{
        SpotifyText(text: "AppName")
        BodyMediumText(text: "AppName")
        BodyLargeText(text: "AppName")
        TitleLarge(text: "AppName")
        TitleMedium(text: "AppName")
        TitleSmall(text: "AppName")
    }
    .background(.black)

}
