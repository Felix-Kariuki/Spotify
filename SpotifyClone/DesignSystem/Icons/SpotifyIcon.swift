//
//  SpotifyIcon.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 30/03/2025.
//

import SwiftUI

struct SpotifyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.74583*width, y: 0.45417*height))
        path.addCurve(to: CGPoint(x: 0.2625*width, y: 0.40625*height), control1: CGPoint(x: 0.6125*width, y: 0.375*height), control2: CGPoint(x: 0.38958*width, y: 0.36667*height))
        path.addCurve(to: CGPoint(x: 0.21458*width, y: 0.38125*height), control1: CGPoint(x: 0.24167*width, y: 0.4125*height), control2: CGPoint(x: 0.22083*width, y: 0.4*height))
        path.addCurve(to: CGPoint(x: 0.23958*width, y: 0.33333*height), control1: CGPoint(x: 0.20833*width, y: 0.36042*height), control2: CGPoint(x: 0.22083*width, y: 0.33958*height))
        path.addCurve(to: CGPoint(x: 0.78542*width, y: 0.38958*height), control1: CGPoint(x: 0.3875*width, y: 0.28958*height), control2: CGPoint(x: 0.63125*width, y: 0.29792*height))
        path.addCurve(to: CGPoint(x: 0.8*width, y: 0.44375*height), control1: CGPoint(x: 0.80417*width, y: 0.4*height), control2: CGPoint(x: 0.81042*width, y: 0.425*height))
        path.addCurve(to: CGPoint(x: 0.74583*width, y: 0.45417*height), control1: CGPoint(x: 0.78958*width, y: 0.45833*height), control2: CGPoint(x: 0.76458*width, y: 0.46458*height))
        path.move(to: CGPoint(x: 0.74167*width, y: 0.57083*height))
        path.addCurve(to: CGPoint(x: 0.69792*width, y: 0.58125*height), control1: CGPoint(x: 0.73125*width, y: 0.58542*height), control2: CGPoint(x: 0.7125*width, y: 0.59167*height))
        path.addCurve(to: CGPoint(x: 0.28333*width, y: 0.53333*height), control1: CGPoint(x: 0.58542*width, y: 0.5125*height), control2: CGPoint(x: 0.41458*width, y: 0.49167*height))
        path.addCurve(to: CGPoint(x: 0.24375*width, y: 0.5125*height), control1: CGPoint(x: 0.26667*width, y: 0.5375*height), control2: CGPoint(x: 0.24792*width, y: 0.52917*height))
        path.addCurve(to: CGPoint(x: 0.26458*width, y: 0.47292*height), control1: CGPoint(x: 0.23958*width, y: 0.49583*height), control2: CGPoint(x: 0.24792*width, y: 0.47708*height))
        path.addCurve(to: CGPoint(x: 0.73333*width, y: 0.52917*height), control1: CGPoint(x: 0.41667*width, y: 0.42708*height), control2: CGPoint(x: 0.60417*width, y: 0.45*height))
        path.addCurve(to: CGPoint(x: 0.74167*width, y: 0.57083*height), control1: CGPoint(x: 0.74583*width, y: 0.53542*height), control2: CGPoint(x: 0.75208*width, y: 0.55625*height))
        path.move(to: CGPoint(x: 0.69167*width, y: 0.68542*height))
        path.addCurve(to: CGPoint(x: 0.65625*width, y: 0.69375*height), control1: CGPoint(x: 0.68333*width, y: 0.69792*height), control2: CGPoint(x: 0.66875*width, y: 0.70208*height))
        path.addCurve(to: CGPoint(x: 0.28958*width, y: 0.65417*height), control1: CGPoint(x: 0.55833*width, y: 0.63333*height), control2: CGPoint(x: 0.43542*width, y: 0.62083*height))
        path.addCurve(to: CGPoint(x: 0.25833*width, y: 0.63542*height), control1: CGPoint(x: 0.275*width, y: 0.65833*height), control2: CGPoint(x: 0.2625*width, y: 0.64792*height))
        path.addCurve(to: CGPoint(x: 0.27708*width, y: 0.60417*height), control1: CGPoint(x: 0.25417*width, y: 0.62083*height), control2: CGPoint(x: 0.26458*width, y: 0.60833*height))
        path.addCurve(to: CGPoint(x: 0.68125*width, y: 0.65*height), control1: CGPoint(x: 0.43542*width, y: 0.56875*height), control2: CGPoint(x: 0.57292*width, y: 0.58333*height))
        path.addCurve(to: CGPoint(x: 0.69167*width, y: 0.68542*height), control1: CGPoint(x: 0.69583*width, y: 0.65625*height), control2: CGPoint(x: 0.69792*width, y: 0.67292*height))
        path.move(to: CGPoint(x: 0.5*width, y: 0.08333*height))
        return path
    }
}
