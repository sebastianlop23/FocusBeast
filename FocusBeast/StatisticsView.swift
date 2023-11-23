//
//  StatisticsView.swift
//  FocusBeast
//
//  Created by Sebastian Lopez on 11/13/23.
//

import SwiftUI
import Charts

struct StatisticsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var streaks = 50
    private var longestSession = 3
    private var sitToStand = 75
    
    let currentWeek: [SessionCount] = [
        SessionCount(day: "20231120", hours: 1),
        SessionCount(day: "20231121", hours: 1),
        SessionCount(day: "20231122", hours: 4),
        SessionCount(day: "20231123", hours: 4),
        SessionCount(day: "20231124", hours: 2),
        SessionCount(day: "20231125", hours: 1),
        SessionCount(day: "20231126", hours: 2)
    ]
    
    var body: some View {
        ZStack{
            VStack{
                Text("Statistics")
                    .font(.custom("OverusedGrotesk-Light_Bold", size: 37))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.top, 30)
                    
                
                GroupBox("Focus Time - This week"){
                    Chart(currentWeek){
                        BarMark(
                            x: .value("Week Day", $0.weekday, unit: .day),
                            y: .value("Step Count", $0.hours)
                        )
                    }
                }
                .padding(15)
                .frame(height: 300)
                
                
                GroupBox("Records"){
                    Text("Streaks - \(streaks) days")
                    Text("Longest Session - \(longestSession) hrs")
                    Text("Sit to stand - \(sitToStand) %")
                }
                .padding(15)
                //.background(Color.blue)
                Spacer()
            }
        }
    }
}

#Preview {
    StatisticsView()
}
struct SessionCount: Identifiable {
    let id = UUID()
    let weekday: Date
    let hours: Int
    
    init(day: String, hours: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.hours = hours
    }
    
    var weekdayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return  dateFormatter.string(from: weekday)
    }
}
