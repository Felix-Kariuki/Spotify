//
//  Router.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    public enum SpotifyDestination: Codable, Hashable {
        case playerview, mainView
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func popNavigate (to destination: SpotifyDestination) {
        path.removeLast(path.count)
        path.append(destination)
    }
    
    func navigate(to destination: SpotifyDestination) {
        path.append(destination)
    }

    
    func navigateBack() {
        path.removeLast()
    }
    
}
