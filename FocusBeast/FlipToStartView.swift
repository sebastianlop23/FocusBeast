//
//  FlipToStartView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/22/23.
//

import SwiftUI

struct FlipToStartView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                RoundedRectangle(cornerRadius: 42) //outer, width was 369 height was 791
                    .stroke(.accent, lineWidth: 6)
                    .frame(width: geometry.size.width * 0.93, height: geometry.size.height * 1.027)
                    .padding(.top)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
            }
            
            VStack{
                Text("FLIP TO START")
                    .font(.custom("OverusedGrotesk-Light_Bold", size: 90))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 60)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
            }
            GeometryReader{ geometry in
                RoundedRectangle(cornerRadius: 28) //mid, w 332 h 757
                    .stroke(.accent, lineWidth: 6)
                    .frame(width: geometry.size.width * 0.86, height: geometry.size.height * 0.99)
                    .padding(.top)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                    .opacity(0.55)
            }
            GeometryReader{ geometry in
                RoundedRectangle(cornerRadius: 20) //inner w 295 h 720
                    .stroke(.accent, lineWidth: 6)
                    .frame(width: geometry.size.width * 0.79, height: geometry.size.height * 0.955)
                    .padding(.top)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                    .opacity(0.25)
            }
            
        }
        .frame(maxWidth: .infinity)
        .background(.black)
        .statusBarHidden(true) //to test yet
        
        
    }
}
/*
#Preview {
    FlipToStartView()
}
*/
