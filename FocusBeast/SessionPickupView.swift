//
//  SessionPickupView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/24/23.
//

import SwiftUI

struct SessionPickupView: View {
    private var timeStopped = "29:16"
    private var remainingTillEnd = 10
    var body: some View {
        VStack{
            VStack{
                Text("Paused - \(timeStopped)").padding(10)
                    .font(.custom("OverusedGrotesk-Light_SemiBold", size: 20))
                    .foregroundColor(.accent)
                    .background(.focus.opacity(0.3))
                    .cornerRadius(10)
            }
            Spacer()
            Text("GET BACK TO WORK")
                .font(.custom("OverusedGrotesk-Light_Bold", size: 90))
                .foregroundColor(Color.white)
                .padding(.horizontal, 60)
                .multilineTextAlignment(.center)
            Spacer()
            VStack{
                Text("\(remainingTillEnd)").padding(.horizontal,15).padding(.vertical,10)
                    .font(.custom("OverusedGrotesk-Light_SemiBold", size: 32))
                    .foregroundColor(.accent)
                    .background(.focus.opacity(0.3))
                    .cornerRadius(20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .statusBarHidden(true) //to test yet
    }
}

#Preview {
    SessionPickupView()
}
