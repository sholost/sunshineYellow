//
//  ContentView.swift
//  sunshineYellow
//
//  Created by Sholihatul Richas on 21/05/26.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Today", systemImage: "tray.and.arrow.down.fill", value: 0) {
                TodayView()
            }
            
            Tab("Log Tommorrow", systemImage: "tray.and.arrow.up.fill", value: 1) {
                LogView()
            }
            
            Tab("Me", systemImage: "tray.and.arrow.up.fill", value: 1) {
                MeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
