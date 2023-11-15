//
//  ContentView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/12/23.
//

import SwiftUI
struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Group {
            if colorScheme == .dark {
                // Show dark mode image
                Image(.darkbackground) // Replace with your dark mode image name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                // Show light mode image
                Image(.lightbackground) // Replace with your light mode image name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .blur(radius: 1)
            
    }
}

struct ContentView: View {
    @State private var selectedTab = 2
    var body: some View {
        TabView(selection: $selectedTab){
            StatisticsView()
                .tabItem { Image(systemName: "chart.bar") }
                .background(BackgroundView())
                .tag(1)
                
            HomeView()
                .tabItem { Image(systemName: "house") }
                .background(BackgroundView())
                .tag(2)
                
            SettingsView()
                .tabItem { Image(systemName: "gearshape") }
                .background(BackgroundView())
                .tag(3)
        }
        .accentColor(.accent)
        
            
            
        
    }
}



#Preview {
    ContentView()
}
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BackgroundView()
                .environment(\.colorScheme, .light)
            BackgroundView()
                .environment(\.colorScheme, .dark)
        }
    }
}
