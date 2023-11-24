//
//  ShortBreakView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/24/23.
//

import SwiftUI

struct ShortBreakView: View {
    @Environment(\.colorScheme) var colorScheme
    private var breakTime = "5:00"
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("LETS GET IT")
                    .font(.custom("OverusedGrotesk-Light_Bold", size: 55))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Text("Take a break")
                    .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
            .padding(.bottom, 50)
            VStack{
                Text("\(breakTime)")
                    .font(.custom("OverusedGrotesk-Light_Bold", size: 35))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Button{
                    //functionality
                }label: {
                    Text("Start")
                        .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding(20)
                }
                .background(colorScheme == .dark ? .black.opacity(0.5) : .white.opacity(0.5))
                .cornerRadius(25)
            }
            Spacer()
            VStack{
                Button{
                    
                }label: {
                    Text("X").padding(.horizontal,15).padding(.vertical,5)
                        .font(.custom("OverusedGrotesk-Light_SemiBold", size: 32))
                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5))
                        .background(colorScheme == .dark ? .black.opacity(0.2) : .white.opacity(0.2))
                        .cornerRadius(20)
                }
                
            }
            
        }
        .background(BackgroundView())
        
    }
}

#Preview {
    ShortBreakView()
}
