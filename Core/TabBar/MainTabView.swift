//
//  MainTabView.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 25/05/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem {
                    Label("search", systemImage: "magnifyingglass")
                }
            
            WsihListView()
                .tabItem {
                    Label("WishList", systemImage: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
