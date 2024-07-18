//
//  MainTabView.swift
//  learn-swiftUI
//
//  Created by ITBCA on 18/07/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Home", systemImage: "magnifyingglass")
                }
                            
            WishlistView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    MainTabView()
}
