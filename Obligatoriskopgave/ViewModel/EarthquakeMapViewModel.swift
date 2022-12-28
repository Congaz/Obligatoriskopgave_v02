//
//  EarthquakeMapViewModel.swift
//  Obligatoriskopgave
//
//  Created by dmu mac 26 on 13/11/2022.
//

import Foundation
import MapKit

class EarthquakeMapViewModel: ObservableObject {
    
    func defineRegion(_ e: Earthquake) -> MKCoordinateRegion {
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: e.geometry.coordinates[1],
                longitude: e.geometry.coordinates[0]
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 10,
                longitudeDelta: 10
            )
        )
    }
    
}
