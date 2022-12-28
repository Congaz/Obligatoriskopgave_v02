//
//  ContentView.swift
//  Obligatoriskopgave
//
//  Created by dmu mac 26 on 10/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State var title = ""
    
    var body: some View {
        NavigationView {
            TabView {
                EarthquakeListView(EarthquakeTimeSpan.Hour)
                    .tabItem {
                        Label("Hour", systemImage: "list.dash")
                    }
                    .onAppear {
                        updateTitle("Hour")
                    }
                EarthquakeListView(EarthquakeTimeSpan.Day)
                    .tabItem {
                        Label("Day", systemImage: "list.dash")
                    }
                    .onAppear {
                        updateTitle("Day")
                    }
                EarthquakeListView(EarthquakeTimeSpan.Week)
                    .tabItem {
                        Label("Week", systemImage: "list.dash")
                    }
                    .onAppear {
                        updateTitle("Week")
                    }
                EarthquakeListView(EarthquakeTimeSpan.Month)
                    .tabItem {
                        Label("Month", systemImage: "list.dash")
                    }
                    .onAppear {
                        updateTitle("Month")
                    }
            }
            .navigationTitle(self.title)
        }
    }
    
    func updateTitle(_ span: String) {
        self.title = "Earthquakes: " + span
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
