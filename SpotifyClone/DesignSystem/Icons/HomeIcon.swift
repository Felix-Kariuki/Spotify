//
//  Home.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 30/03/2025.
//

import SwiftUI

struct HomeIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.875*width, y: 0.46875*height))
        path.addLine(to: CGPoint(x: 0.875*width, y: 0.84375*height))
        path.addLine(to: CGPoint(x: 0.625*width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.64063*height))
        path.addLine(to: CGPoint(x: 0.42188*width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.84375*height))
        path.addLine(to: CGPoint(x: 0.15625*width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.46875*height))
        path.addLine(to: CGPoint(x: 0.45582*width, y: 0.11207*height))
        path.addLine(to: CGPoint(x: 0.85668*width, y: 0.42457*height))
        return path
    }
}
