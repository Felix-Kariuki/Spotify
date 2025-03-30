//
//  SpotifyCloneApp.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 27/02/2025.
//

import SwiftUI


@main
struct SpotifyCloneApp:App {
    
    @StateObject private var navigationRouter = NavigationRouter()
    
    var body: some Scene {
        WindowGroup{
            NavigationStack(path: $navigationRouter.path, root: {
                MainView().navigationDestination(for: NavigationRouter.SpotifyDestination.self){ destination in
                    switch destination {
                    case.playerview:
                        PlayerMainView()
                            .environmentObject(navigationRouter)
                            .navigationBarBackButtonHidden(true)
                        
                    case .mainView: MainView()
                            .environmentObject(navigationRouter)
                        
    
                    }
                }
                .environmentObject(navigationRouter)
            })
        }
    }
}

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
