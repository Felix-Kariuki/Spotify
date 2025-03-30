//
//  VerticalSpacer.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import Foundation
import SwiftUI

struct VerticalSpacer : View {
    enum Size {
        case extraSmall, small, medium, large, extraLarge
    }
    
    var size: Size
    
    var body: some View {
        Spacer().frame(height: heightForSize(size))
    }
    
    private func heightForSize(_ size: Size) -> CGFloat {
        switch size{
        case .extraSmall: return spacing.extraSmall
        case .small: return spacing.small
        case .medium: return spacing.medium
        case .large: return spacing.large
        case .extraLarge: return spacing.extraLarge
        }
    }
}
