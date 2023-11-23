//
//  HomeView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/13/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showUnlock = false
    @State private var didUnlock = false
    
    var body: some View {
        ZStack {
            VStack {
                // Top status bar icons
                HStack {
                    VStack{
                        Image(systemName: "flame.fill")
                        Text("13")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "figure.walk.motion")
                        Text("92%")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "trophy.fill")
                        Text("2hr")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                    }
                }
                .font(.system(size: 12))
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding(.horizontal, 50)
                .padding(.top, 10)
                
                Spacer()
                
                // Main timer display
                Text("🏁4:19PM")
                    .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Text("50:00")
                    .font(.custom("OverusedGrotesk-Light_Bold", size: 100))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                
                Spacer()
                
                // Slider button (Custom component needed for functionality)
                VStack {
                    if showUnlock {
                        SwipeToUnlockView()
                            .onSwipeSuccess {
                                self.didUnlock = true
                                self.showUnlock = false
                            }
                    }
                }
                
                Spacer()
                
                if didUnlock {
                    ConfirmationView()
                        
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                                self.didUnlock = false
                                self.showUnlock = true
                            }
                        }
                }
                
            }
            
            .onAppear() {
                self.showUnlock = true
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}


