//
//  ContentView.swift
//  Obligatoriskopgave
//
//  Created by dmu mac 26 on 10/11/2022.
//

import SwiftUI

struct EarthquakeListView: View {
    @State var timeSpan: EarthquakeTimeSpan
    // Needs to be an EnvironmenObject.
    // Otherwise updating of viewModel.earthquakes (published var) doesn't work properly
    @EnvironmentObject var viewModel: EarthquakeListViewModel
    
    // Definition of var with population function
    private var earthquakes: [Earthquake] {
        viewModel.earthquakes.sorted(by: { e1, e2 in
            e1.properties.mag < e2.properties.mag
        })
    }
    
    init(_ timeSpan: EarthquakeTimeSpan) {
        self.timeSpan = timeSpan
        // Set color on back-button (affects all views)
        UIBarButtonItem.appearance().tintColor = .black
    }
    
    var body: some View {
        List(self.earthquakes) { e in
            NavigationLink(destination: EarthquakeMapView(earthquake: e)) {
                Label("Icon Only", systemImage: "globe.europe.africa")
                    .font(.system(size: 40))
                    .labelStyle(.iconOnly)
                Text(String(format: "%.2f", e.properties.mag))
                    .font(.system(size: 25))
                VStack(alignment: .leading) {
                    Text(dateToString(e.properties.time))
                    Text(e.properties.place)
                        .font(Font.body.bold())
                }
            }
            .listRowInsets(.init(top: 15, leading: 10, bottom: 15, trailing: 15))
            .listRowBackground(Color.yellow)
        }
        .onAppear {
            viewModel.loadEarthquakes(timeSpan)
        }
    }
    
    func dateToString(_ date: Date) -> String {
        // Timezone is auto-set to system default (Europe/Copenhagen)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "da_DK")
        dateFormatter.setLocalizedDateFormatFromTemplate("E, d MMM yyyy HH:mm")
        return dateFormatter.string(from: date)
    }
    
}

struct EarthquakeListView_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeListView(EarthquakeTimeSpan.Hour)
    }
}
