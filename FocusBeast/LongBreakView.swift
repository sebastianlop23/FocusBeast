//
//  LongBreakView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/24/23.
//

import SwiftUI

struct LongBreakView: View {
    @Environment(\.colorScheme) var colorScheme
    private var longBreakTime = "10:00"
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack{
                    Text("LETS GET IT")
                        .font(.custom("OverusedGrotesk-Light_Bold", size: 55))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    Text("Stand up and move")
                        .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                .padding(.bottom, 50)
                VStack{
                    Text("\(longBreakTime)")
                        .font(.custom("OverusedGrotesk-Light_Bold", size: 35))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                Spacer()
                VStack{
                    Button{
                        
                    }label: {
                        Text("x").padding(.horizontal,15).padding(.vertical,5)
                            .font(.custom("OverusedGrotesk-Light_SemiBold", size: 32))
                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.2) : .black.opacity(0.2))
                            .background(colorScheme == .dark ? .black.opacity(0.1) : .white.opacity(0.1))
                            .cornerRadius(20)
                    }
                }
                .padding(.bottom, 30)
            }
            .background(BackgroundView())
            GeometryReader{ geometry in
                RoundedRectangle(cornerRadius: 42) //outer, width was 369 height was 791
                    .stroke(colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), lineWidth: 6)
                    .frame(width: geometry.size.width * 0.93, height: geometry.size.height * 1.027)
                    .padding(.top)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
            }
            GeometryReader{ geometry in
                RoundedRectangle(cornerRadius: 28) //mid, w 332 h 757
                    .stroke(colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), lineWidth: 6)
                    .frame(width: geometry.size.width * 0.86, height: geometry.size.height * 0.99)
                    .padding(.top)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                    .opacity(0.55)
            }
            GeometryReader{ geometry in
                RoundedRectangle(cornerRadius: 20) //inner w 295 h 720
                    .stroke(colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), lineWidth: 6)
                    .frame(width: geometry.size.width * 0.79, height: geometry.size.height * 0.955)
                    .padding(.top)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                    .opacity(0.25)
            }
        }
        
    }
}

#Preview {
    LongBreakView()
}
