//
//  ViewModel.swift
//  PersistenceBruus
//
//  Created by dmu mac 26 on 27/10/2022.
//

import Foundation

class EarthquakeListViewModel: ObservableObject {
    // We define earthquakes as a published var beacuse of async condition.
    // This way, any objects who uses earthquakes will be notified when it changes.
    @Published var earthquakes: [Earthquake] = []
    
    func loadEarthquakes(_ timeSpan: EarthquakeTimeSpan) {
        Task {
            await fetchEarthquakes(timeSpan)
        }
    }
    
    func fetchEarthquakes(_ timeSpan: EarthquakeTimeSpan) async {
        do {
            let tmp = try await NetworkService.fetchEarthquakes(timeSpan)
            // Update earthquakes array in main thread (instead of background task)
            DispatchQueue.main.async {
                self.earthquakes = tmp
            }
        } catch {
            print(error)
        }
    }
}
