//
//  HomeView.swift
//  SpotifyClone
//
//  Created by Felix kariuki on 29/03/2025.
//

import SwiftUI

struct HomeView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let rows = [GridItem(.flexible())]
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    var body: some View {
            VStack(alignment:.leading,spacing: spacing.medium){
                
                VerticalSpacer(size: .large)
                
                TopOptionsItem()
                    .padding(.horizontal)
                
                ScrollView(.vertical,showsIndicators: false){
                    LazyVGrid(columns:columns, spacing: spacing.small){
                        ForEach(topRecommedations){ item in
                            TopRecommedationCard(option: item)
                        }
                    }.padding(.horizontal)
                    VerticalSpacer(size: .medium)
                    VerticalSpacer(size: .small)
                    
                    topMixesItem
                    
                    VerticalSpacer(size: .medium)
                    VerticalSpacer(size: .small)
                    
                    todayHitsItem
                    
                    VerticalSpacer(size: .medium)
                    VerticalSpacer(size: .small)
                    
                    todayHitsItem
                    
                    VerticalSpacer(size: .extraLarge)
                    VerticalSpacer(size: .extraLarge)
                }
                
                
                
                Spacer()
            }
            
//            BottomPlayer(
//                onClick: {
//                router.navigate(to: .playerView)
//            }).padding(.horizontal,10)
//                .padding(.vertical,88)
    
        .padding(EdgeInsets(top: spacing.extraMedium, leading: spacing.none, bottom: spacing.none,trailing: spacing.none))
        .background{
            LinearGradient(colors: [
                Theme.background.opacity(0.6),
                Theme.background.opacity(0.6),
                Theme.background.opacity(0.8),
                Theme.background.opacity(0.9),
            ],startPoint: .top,endPoint: .bottom)
        }.ignoresSafeArea()
        
        
    }
}

private extension HomeView {
    var topMixesItem: some View {
        VStack(alignment: .leading,spacing: spacing.medium){
            TitleLarge(text: "TopMixes").padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                LazyHGrid(rows:rows, spacing: spacing.extraMedium){
                    ForEach(topMixes){ item in
                        MixesComponent(option: item)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

private extension HomeView {
    var todayHitsItem: some View {
        VStack(alignment: .leading,spacing: spacing.extraMedium){
            TitleLarge(text: "TodayHits").padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                LazyHGrid(rows:rows, spacing: spacing.medium){
                    ForEach(topMixes){ item in
                        MixesComponent(option: item)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
