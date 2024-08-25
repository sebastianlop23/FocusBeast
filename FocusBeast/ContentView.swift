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
        .blur(radius: 7)
            
    }
}

struct ContentView: View {
    @State private var selectedTab = 2 //starting on 2nd tab
    //@Binding var didUnlock: Bool
    @State private var didUnlock = false
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab){
                StatisticsView()
                    .tabItem { Image(systemName: "chart.bar") }
                    .background(BackgroundView())
                    .tag(1)
                    
                HomeView(didUnlock: .constant(false))
                    .tabItem { Image(systemName: "house") }
                    .background(BackgroundView())
                    .tag(2)
                    
                SettingsView()
                    .tabItem { Image(systemName: "gearshape") }
                    //.background(BackgroundView())
                    .tag(3)
                FlipToStartView()
                
            }
            .accentColor(.accent)
            .onAppear{
                if didUnlock{
                    selectedTab = 4
                }
            }
            
        }
        
        
        
    }
}


/*
#Preview {
    ContentView(didUnlock: .constant(false))
}
 */
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
