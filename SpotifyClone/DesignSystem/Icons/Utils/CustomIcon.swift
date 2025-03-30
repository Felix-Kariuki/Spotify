//
//  SpotifyIcon.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 30/03/2025.
//

import SwiftUI

struct CustomIcon: Shape {
    private let path: @Sendable (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        self.path = { @Sendable rect in
            shape.path(in: rect)
        }
    }

    func path(in rect: CGRect) -> Path {
        path(rect)
    }
}
