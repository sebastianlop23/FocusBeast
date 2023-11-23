//
//  SettingsView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/13/23.
//

import SwiftUI


struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var isFlashlightEnabled: Bool = false
    @State var isVibrationEnabled: Bool = true
    @State var isAutoBreakEnabled: Bool = false
    @State private var sliderValue: Double = .zero
    @State private var score = 0
    @State private var selection = "10 mins"
    let focusOptions = ["10 mins", "20 mins","25 mins", "30 mins", "40 mins","50 mins","1 hr","1.5 hrs","2 hrs"]
        
    
    var body: some View {
        ZStack{
            //BackgroundView()
            NavigationStack{
                ZStack{ //Settings content
                    Form {
                        
                        Section(header: Text("Session"), content: {
                            HStack{
                                Text("Focus Session")
                                //TextField("hrs", value: $score, format: .number).textFieldStyle(.roundedBorder)
                                Picker("", selection: $selection, content: {
                                    ForEach(focusOptions, id: \.self){
                                        Text($0)
                                    }
                                })
                            }
                            HStack{
                                Text("Ringer")
                                Slider(
                                value: $sliderValue,
                                    in: 1...5
                                )
                            }
                            HStack{
                                Toggle(isOn: $isVibrationEnabled) {
                                    Text("Vibration")
                                }
                            }
                            HStack{
                                Toggle(isOn: $isFlashlightEnabled) {
                                    Text("Flashlight Notification")
                                }
                            }
                            HStack{
                                Toggle(isOn: $isAutoBreakEnabled) {
                                    Text("Start breaks automatically")
                                }
                            }
                            HStack{
                                Button(action: { }, label: {Text("Demo session")} )
                            }
                            
                        })
                        Section(header: Text("Account"), content: {
                            HStack{
                                Button(action: { }, label: {Text("Change password")} )
                            }
                            HStack{
                                Button(action: { }, label: {Text("Logout").foregroundColor(Color.red)} )
                            }
                        })
                        Section(header: Text("About"), content: {
                            HStack{
                                Button(action: { }, label: {Text("Website")} )
                            }
                            HStack{
                                Button(action: { }, label: {Text("Leave a review")} )
                            }
                        })
                    }
                    .accentColor(.blue)
                    
                }
                .navigationTitle("Settings")
            }
        }
        
        
        
        
        
    }
    
    
}

#Preview {
    SettingsView()
}
