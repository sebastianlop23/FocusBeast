//
//  SessionView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/24/23.
//

import SwiftUI

struct SessionView: View {
    private var time = "60:00"
    var body: some View {
        VStack{
            Text("\(time)")
                .font(.custom("OverusedGrotesk-Light_Bold", size: 90))
                .foregroundColor(Color.focus)
                .padding(.horizontal, 60)
                .multilineTextAlignment(.center)
                .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .statusBarHidden(true) //to test yet
    }
}

#Preview {
    SessionView()
}
