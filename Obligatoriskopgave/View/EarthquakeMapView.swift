//
//  EarthquakeMapView.swift
//  Obligatoriskopgave
//
//  Created by dmu mac 26 on 10/11/2022.
//

import SwiftUI
import MapKit

struct EarthquakeMapView: View {
    var earthquake: Earthquake
    @State private var viewModel = EarthquakeMapViewModel()
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                // Header.
                Text(earthquake.properties.place)
                    .font(.system(size: 30))
                    .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: 200, alignment: .bottom)
            .background(Color.yellow)
            // Map requires an array for annotationItems.
            // As we only have one item, we simply feed it an anomymous array with our single entry.
            Map(coordinateRegion: $region, annotationItems: [earthquake]) { e in
                MapMarker(
                    coordinate: CLLocationCoordinate2D(
                        latitude: e.geometry.coordinates[1],
                        longitude: e.geometry.coordinates[0]),
                    tint: .red
                )
            }
            .onAppear {
                DispatchQueue.main.async {
                    self.region = viewModel.defineRegion(earthquake)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct EarthquakeMapView_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeMapView(earthquake: Earthquake(
            properties: Earthquake.Property(
                mag: 2.7,
                place: "63 km S of Shungnak, Alaska",
                time: Date()
            ),
            geometry: Earthquake.Geometry(
                type: "Point",
                coordinates: [-156.992, 66.3218, 0]
            )
        ))
    }
}


